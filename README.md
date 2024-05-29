# jq - Exercises
A repository containing samples with [jq](https://github.com/jqlang/jq "Link to jq repository").

## Repository structure
### Data
A folder containing test data in the form of JSON files.
### Modules
jq modules

## Example commands
### Second order in the first batch
`jq '.[1]' data/order1.json`

**Result**
```
{
  "ID": "134c8488-48f7-47b8-851f-4994483ffdaf",
  "Source": "Test company 2",
  "Date": "25.9.2024",
  "Items": [
    {
      "Name": "Test item 2",
      "Price": 108.4,
      "Count": 7
    }
  ]
}
```

### Selecting specific fields from the first order
`jq '.[0] | {id: .ID, company: .Source, date: .Date}' data/order1.json`

**Result**
```json
{
  "id": "22c533b3-04f5-43d6-bb08-9de5257bedc1",
  "company": "Test company 1",
  "date": "11-25-2024"
}
```
_Note_: To select certain fields from all items:

`jq '.[] | {id: .ID, company: .Source, date: .Date}' data/order1.json`
### Multiplying price of every item by a coeficient
`jq '.[] | .Items.[].Price | . * 0.23' data/order1.json`

**Result**
```
11.592
24.932000000000002
```
### Select
`jq '.[] | .Items.[].Price | . * 0.23 | select(. >= 15)' data/order1.json`

**Result**
24.932000000000002

### Order IDs across multiple files
`jq '.[] | {id:.ID, number_of_items:.Items.[].Count} | select(.number_of_items >= 7)' data/*.json`

**Result**
```json
{
  "id": "22c533b3-04f5-43d6-bb08-9de5257bedc1",
  "number_of_items": 23
}
{
  "id": "134c8488-48f7-47b8-851f-4994483ffdaf",
  "number_of_items": 7
}
{
  "id": "134c8488-48f7-47b8-851f-4994483ffdaf",
  "number_of_items": 7
}
```
### Average price of each product across multiple files
`jq -f modules/per_item_price.jq data/*.json`

**Result**
```json
{
  "product": "Test item 1",
  "avg_price": 2.1913043478260867
}
{
  "product": "Test item 2",
  "avg_price": 15.485714285714286
}
{
  "product": "Test item 3",
  "avg_price": 15.485714285714286
}
{
  "product": "Test item 4",
  "avg_price": 44.2
}
```
