require_relative '../questions_database.rb'

class QuestionLike

  attr_accessor :id, :liker_user_id, :liked_question_id

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL
    QuestionLike.new(data.first)
  end

  def self.find_by_liker_user_id(liker_user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, liker_user_id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        liker_user_id = ?
    SQL
    data.map { |d| QuestionLike.new(d) }
  end

  def self.find_by_liked_question_id(liked_question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, liked_question_id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        liked_question_id = ?
    SQL
    data.map { |d| QuestionLike.new(d) }
  end

  def initialize(options)
    @id = options['id']
    @liker_user_id = options['liker_user_id']
    @liked_question_id = options['liked_question_id']
  end

end
