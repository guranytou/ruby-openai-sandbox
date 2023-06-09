require 'openai'

# OpenAI APIの設定
client = OpenAI::Client.new(
    access_token: ""
)

prompt = "You are an excellent bookseller.
The output should be a markdown code snippet formatted in the following schema in Japanese:
\`\`\`json
[
  {
   title: string, // title of the book.
   description: string // description of the book.
  },
  {
   title: string, // book title
   description: string // book description.
  }
]
\`\`\`

NOTES:
* Do not include books that do not exist.
* Please list only books by Japanese authors.
* Please do not include anything other than JSON in your answer.
* Response must be Japanese

I would like to know an interesting Japanese SF novel. Please recommend 5 books."

# APIにリクエストを送信
response = client.chat(
    parameters: {
        model: "gpt-3.5-turbo",
        messages: [{role: "user", content: prompt}],
    }
)

print "response: #{response}\n" 

# 応答の整形
response_data = JSON.parse(response["choices"][0]["message"]["content"].slice(/```json([\s\S]*?)```/).gsub('```json', '').gsub('```',''))
books = response_data.map do |book|
  {
    title: book['title'],
    description: book['description']
  }
end


# 出力
print "books: #{books}\n"
print "1冊目のタイトル: #{books[0][:title]}\n"
