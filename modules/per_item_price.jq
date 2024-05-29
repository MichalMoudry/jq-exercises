.[].Items.[]
| [.Name, .Price / .Count]
| {product: .[0], avg_price: .[1]}