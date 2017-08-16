require_relative '../questions_database.rb'
require_relative 'question'

class QuestionFollow

  attr_accessor :id, :user_id, :question_id

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    QuestionFollow.new(data.first)
  end

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        user_id = ?
    SQL
    data.map { |d| QuestionFollow.new(d) }
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        question_id = ?
    SQL
    data.map { |d| QuestionFollow.new(d) }
  end

  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        u.*
      FROM
        users u
      JOIN
        question_follows q
      ON
        u.id = q.user_id
      WHERE
        q.question_id = ?
    SQL
    data.map { |d| User.new(d) }
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        q.*
      FROM
        questions q
      JOIN
        question_follows f
      ON
        q.user_id = f.user_id
      WHERE
        q.user_id = ?
    SQL
    data.map { |d| Question.new(d) }
  end

  def self.most_followed_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        q.*
      FROM
        questions q
      LEFT JOIN
        question_follows f
      ON
        q.id = f.question_id
      GROUP BY
        q.id
      ORDER BY
        COUNT(f.question_id) DESC
      LIMIT
        ?
    SQL
    data.map { |d| Question.new(d) }
  end


  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end
