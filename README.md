# los_tour_graph

# CSV 生成

los があるディレクトリで `rails r` 第2引数に対象モデル

```sh
# bin/rails r ../los_tour_graph/csv_generater.rb model_name
bin/rails r ../los_tour_graph/csv_generater.rb hotel > ../los_tour_graph/hotel.csv

```

# png 生成

```sh
sh dot.sh hotel.csv
```

