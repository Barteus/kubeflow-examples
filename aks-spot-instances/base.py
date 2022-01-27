#!pip install kfp --upgrade

import kfp
import kfp.components as comp
from kfp import dsl

import glob
import pandas as pd
import tarfile
import urllib.request

def download_and_merge_csv(url: str, output_csv: str):
  with urllib.request.urlopen(url) as res:
    tarfile.open(fileobj=res, mode="r|gz").extractall('data')
  df = pd.concat(
      [pd.read_csv(csv_file, header=None)
       for csv_file in glob.glob('data/*.csv')])
  df.to_csv(output_csv, index=False, header=False)

  download_and_merge_csv(
    url='https://storage.googleapis.com/ml-pipeline-playground/iris-csv-files.tar.gz',
    output_csv='merged_data.csv')


#!head merged_data.csv


def merge_csv(file_path: comp.InputPath('Tarball'),
              output_csv: comp.OutputPath('CSV')):
    import glob
    import pandas as pd
    import tarfile

    tarfile.open(name=file_path, mode="r|gz").extractall('data')
    df = pd.concat(
        [pd.read_csv(csv_file, header=None)for csv_file in glob.glob('data/*.csv')])
    df.to_csv(output_csv, index=False, header=False)



create_step_merge_csv = kfp.components.create_component_from_func(
        func=merge_csv,
        output_component_file='component.yaml', # This is optional. It saves the component spec for future use.
        base_image='python:3.7',
        packages_to_install=['pandas==1.1.4'])

web_downloader_op = kfp.components.load_component_from_url(
            'https://raw.githubusercontent.com/kubeflow/pipelines/master/components/web/Download/component.yaml')




from kubernetes.client.models import V1Toleration, V1Affinity, V1NodeAffinity, V1NodeSelector, V1NodeSelectorTerm, V1NodeSelectorRequirement

@dsl.pipeline(
    name="bpk_pipeline",
    description="test desc",
)
def my_pipeline(url):
    web_downloader_task = web_downloader_op(url=url)
    merge_csv_task = create_step_merge_csv(file=web_downloader_task.outputs['data'])

    toleration = V1Toleration(
        key="kubernetes.azure.com/scalesetpriority",
        operator="Equal",
        value="spot",
        effect="NoSchedule",
    )
    web_downloader_task.add_toleration(toleration)
    merge_csv_task.add_toleration(toleration)

    aff = V1Affinity(node_affinity=V1NodeAffinity(
        required_during_scheduling_ignored_during_execution=V1NodeSelector(
            node_selector_terms=[V1NodeSelectorTerm(
                match_expressions=[V1NodeSelectorRequirement(
                    key='kubernetes.azure.com/scalesetpriority',
                    operator='In',
                    values=['spot'])])]))
    )
    web_downloader_task.add_affinity(aff)
    merge_csv_task.add_affinity(aff)


client = kfp.Client()


client.create_run_from_pipeline_func(
    my_pipeline,
    arguments={
        'url': 'https://storage.googleapis.com/ml-pipeline-playground/iris-csv-files.tar.gz'
    })
