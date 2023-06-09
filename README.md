## memo

- curl で叩いてみた

```
curl https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
    "model": "gpt-3.5-turbo",
    "messages": [{"role": "user", "content": "Hello!"}]
  }'

{
  "id": "chatcmpl-7PM17IO2wup77o47vTh7jGxD2NbsX",
  "object": "chat.completion",
  "created": 1686277189,
  "model": "gpt-3.5-turbo-0301",
  "usage": {
    "prompt_tokens": 10,
    "completion_tokens": 10,
    "total_tokens": 20
  },
  "choices": [
    {
      "message": {
        "role": "assistant",
        "content": "Hello there! How can I assist you today?"
      },
      "finish_reason": "stop",
      "index": 0
    }
  ]
}
```

- OpenAPI からのレスポンス

````
response: {"id"=>"chatcmpl-7PLNeSkv0ZB3Yp04oyWKysvQ7SPZC", "object"=>"chat.completion", "created"=>1686274742, "model"=>"gpt-3.5-turbo-0301", "usage"=>{"prompt_tokens"=>142, "completion_tokens"=>418, "total_tokens"=>560}, "choices"=>[{"message"=>{"role"=>"assistant", "content"=>"以下は、日本のSF小説の中で興味深いもののリストです:\n\n```json\n[\n  {\n    \"title\": \"草祭りの夜\", \n    \"description\": \"太宰治によるSF小説の傑作。未来の社会を描写した作品で、作者の哲学的考察が反映されている。\"\n  },\n  {\n    \"title\": \"侍霊漂流記\", \n    \"description\": \"小松左京による歴史SF小説。江戸時代末期の幕末を舞台に、侍たちがタイムトラベルをする奇想天外な物語。\"\n  },\n  {\n    \"title\": \"ロボット・アンドロイド\", \n    \"description\": \"星新一による短編SF小説集。異色の作家によるサイエンスフィクション作品を収録している。\"\n  },\n  {\n    \"title\": \"彼方から\", \n    \"description\": \"伊藤計劃によるSF小説。地球外生命体によって侵略された未来の日本を描いた壮大なストーリー。\"\n  },\n  {\n    \"title\": \"銀河鉄道の夜\", \n    \"description\": \"宮沢賢治による児童文学SF小説。童心に返る物語でありながら、SF要素も含んでいる。\"\n  }\n]\n```"}, "finish_reason"=>"stop", "index"=>0}]}
````

- 整形した結果

```
books: [{:title=>"草祭りの夜", :description=>"太宰治によるSF小説の傑作。未来の社会を描写した作品で、作者の哲学的考察が反映されている。"}, {:title=>"侍霊漂流記", :description=>"小松左京による歴史SF小説。江戸時代末期の幕末を舞台に、侍たちがタイムトラベルをする奇想天外な物語。"}, {:title=>"ロボット・アンドロイド", :description=>"星新一による短編SF小説集。異色の作家によるサイエンスフィクション作品を収録している。"}, {:title=>"彼方から", :description=>"伊藤計劃によるSF小説。地球外生命体によって侵略された未来の日本を描いた壮大なストーリー。"}, {:title=>"銀河鉄道の夜", :description=>"宮沢賢治による児童文学SF小説。童心に返る物語でありながら、SF要素も含んでいる。"}]
```

- 1 冊目のタイトルを抽出

```
1冊目のタイトル: 草祭りの夜
```
