admin = User.create(username: "admin", password: "nkv674zunyd9nbtx", account_type: "admin")
user_l = User.create(username: "catlady", password: "abc123", account_type: "user")
user_m = User.create(username: "catman", password: "abc123", account_type: "user")

#  "title", "genre", "year", "summary", "user_id"

Movie.create(title: "A Single Man", genre: "Drama", year: "2009", summary: "An English professor, one year after the sudden death of his boyfriend, is unable to cope with his typical days in 1960s Los Angeles.", user_id: 1)
Movie.create(title: "Love, Simon", genre: "Romcom", year: "2018", summary: "Everyone deserves a great love story, but for 17-year-old Simon, it's a bit complicated.", user_id: 2)
Movie.create(title: "Some Like It Hot", genre: "Comedy", year: "1959", summary: "After two male musicians witness a mob hit, they flee the state in an all-female band disguised as women, but further complications set in.", user_id: 3)

Comment.create(content: "", movie_id: , user_id: )