# Ruby application for Yandex.XML service

**Yandex.XML service:** [https://xml.yandex.ru/settings/](https://xml.yandex.ru/settings/)

**Yandex regions:** [https://tech.yandex.ru/xml/doc/dg/reference/regions-docpage/](https://tech.yandex.ru/xml/doc/dg/reference/regions-docpage/)

**Class YandexXml has settings:** user, key, region, keyword

## Check site position in the search for keywords in Yandex (with Yandex.XML)

**Single parsing:**
```ruby
require './yandex_xml.rb'

parse = YandexXml.new('your_yandex_login', 'your_yandex_xml_key')

parse.region = '47'

# Single parsing
parse.keyword = 'пластиковые окна'
parse.get_xml('domain')
```

**Group parsing**
```ruby
require './yandex_xml.rb'

parse = YandexXml.new('your_yandex_login', 'your_yandex_xml_key')

parse.region = '47'

words = ['пластиковые окна', 'окна пвх']

# Group parsing
words.each do |word|
  parse.keyword = word
  parse.get_xml('domain')
end
```

### Options from method get_xml:

See: [https://tech.yandex.ru/xml/doc/dg/concepts/response-docpage/](https://tech.yandex.ru/xml/doc/dg/concepts/response-docpage/)

```ruby
"found-docs",
"found-docs-human",
"domain",
"title",
"headline",
"hlword",
"modtime",
"size",
"charset",
"passages",
"passage",
"mime-type",
"_PassagesType",
"lang",
"saved-copy-url"
```