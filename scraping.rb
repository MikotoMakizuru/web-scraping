require 'nokogiri'
require 'open-uri'
require 'csv'

# スクレイピング先のURL
url = ''

# URLを指定してページを取得
html = URI.open(url).read

# Nokogiriで解析
doc = Nokogiri::HTML.parse(html)

# テーブルの行を取得
rows = doc.css('div article')
binding.irb

# CSVファイルに書き込む
CSV.open('output.csv', 'w') do |csv|
  rows.each do |row|
    # 行のセルを取得
    cells = row.css('h2 a').map(&:text)

    # CSVファイルに書き込む
    csv << cells
  end
end
