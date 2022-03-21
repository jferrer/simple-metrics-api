# Simple Metrics API

This API is part of [Simple Metrics](https://github.com/jferrer/simple-metrics).

## Stack

- Rails API-only v6.1
- Posgresql

## Endpoints

### Home
```
GET api/
```

```
curl http://0.0.0.0:7080/api
```

```
{"app":"Simple Metrics","status":"ok"}
```

### Create
```
POST api/metrics
```

```
curl --header "Content-Type: application/json" \
  --request POST \
  --data "{\"name\": \"features\", \"value\": 1}" \
  http://0.0.0.0:7080/api/metrics
```

```
{"name":"features","value":1,"created_at":"2022-03-21T08:53:04.509Z"}
```

```
curl --header "Content-Type: application/json" \
  --request POST \
  --data "{\"name\": \"features\"}" \
  http://0.0.0.0:7080/api/metrics
```

```
{"message":"Validation Failed","errors":["Value is not included in the list"]}
```

### Get
```
GET api/metrics
```

Get Week metrics grouped by days:

```
curl -X GET "http://0.0.0.0:7080/api/metrics?week=2022-03-21"
```

```
{"data":[["2022-03-21",713],["2022-03-22",699],["2022-03-23",688],["2022-03-24",705],["2022-03-25",728],["2022-03-26",730],["2022-03-27",747]],"avg":715}
```

Get Day metrics grouped by hours:

```
curl -X GET "http://0.0.0.0:7080/api/metrics?day=2022-03-21"
```

```
{"data":[[0.0,27],[1.0,29],[2.0,29],[3.0,33],[4.0,30],[5.0,30],[6.0,32],[7.0,31],[8.0,25],[9.0,30],[10.0,28],[11.0,27],[12.0,32],[13.0,27],[14.0,27],[15.0,30],[16.0,25],[17.0,34],[18.0,35],[19.0,35],[20.0,28],[21.0,23],[22.0,33],[23.0,33]],"avg":29}
```

## Pending improvements

- Remove unused engines
- Add `dry-rb` to better manage of Business Logic, Validations, Errors...
- Add `Fabrication` gem for better tests examples instead of loading seed
- Add `Sidekiq` and schedule to aggregate data in background and update Frontend in Real-Time
- Github actions for CI

