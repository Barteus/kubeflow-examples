#!/bin/bash

#CHANGE IP!
curl  -s http://10.152.183.197:8000/api/v0.1/predictions \
  -H "Content-Type: application/json" \
  -d '{"data":{"ndarray":[[10.1, 0.37, 0.34, 2.4, 0.085, 5.0, 17.0, 0.99683, 3.17, 0.65, 10.6]]}}'

#---

curl -v "http://data-drift-detection.wine.10.64.140.43.sslip.io" \
  -X POST \
  -H "Ce-Id: say-hello" \
  -H "Ce-Specversion: 1.0" \
  -H "Ce-Type: event-display" \
  -H "Ce-Source: curl-pod" \
  -H "Content-Type: application/json" \
  -d '{"data":{"ndarray":[[10.1, 0.37, 0.34, 2.4, 0.085, 5.0, 17.0, 0.99683, 3.17, 0.65, 10.6]]}}'
