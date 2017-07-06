contens = [
  "DBのテーブル名やカラム名と日本語名との対応付けをEXCELで管理してたりするプロジェクトもあるかもしれませんが、プログラマからするとDBを実際に操作する箇所でまとめて管理したいものです。Rails5からはDBを操作するマイグレーションでテーブルやカラムにコメントを付けることができるようになりました。ただし現在はMySQLとPostgreSQL限定です。",
  "超初心者がReactの機能を使ってみた\ninputタグに入力した文字をその下に設置したpタグに表示させてみました。\n参考にさせてもらったサイト(丸写し)\n作業環境\nBabel\nReact\nReactDOM\n書いてみた",
  "avascriptとは\n様々なWebブラウザで利用可能なインタプリタ型のプログラミング言語である\n最近ではサーバサイドやスマーフォンアプリ開発ようなど様々な場面で利用できる非常に応用範囲の広い言語である\n※インタプリタ：プログラミング言語で書かれたソースコードないし、中間表現にある命令列を逐次解釈しながら実行するプログラムのこと。",
  "xcode command line toolsを設置するとgitやpython、rubyなどのコマンドが使える。設置されたのはpythonの2系でした。",
  "はじめまして。\n最初の記事がこんなタイトルでいいのかワタクシ。\nRuby経験ゼロ（実はちょっとだけかじったことあるくらい）のワタクシが技術者認定試験の合格を目指して勉強を開始したのですが、RubyってWebアプリ開発用なんだっけ？　という基本的なこともわからない状態からのスタート。 こんなド初心者の疑問を色々集めてみました。この記事は疑問があればどんどん更新します。"
]

contens.each do |content|
  Micropost.create!(content: content, user_id: User.all.pluck(:id).sample)
end