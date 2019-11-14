
require_relative 'user'
require_relative 'questions'
require 'sqlite3'

class QuestionFollows
  attr_accessor  :question_id, :author_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| QuestionFollows.new(datum) }
  end

  def initialize(options)
    @question_id = options['question_id']
    @author_id = options['author_id']
  end

  def self.followers_for_question_id(question_id)

      data =  QuestionsDatabase.instance.execute(<<-SQL, question_id)
      
      SELECT users.fname, users.lname, users.id
      FROM users
      JOIN
      (SELECT DISTINCT users.id
      FROM users
      JOIN question_follows ON question_follows.author_id = users.id
      WHERE question_follows.question_id = ?) AS followers
      ON users.id = question_follows.author_id

      SQL
      data.map { |datum| User.new(datum) }
  end
end