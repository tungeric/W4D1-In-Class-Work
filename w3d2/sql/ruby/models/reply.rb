require_relative '../questions_database.rb'

class Reply

  attr_accessor :id, :body, :author_user_id, :subject_question_id, :parent_reply_id

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    Reply.new(data.first)
  end

  def self.find_by_author_user_id(author_user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        author_user_id = ?
    SQL
    data.map { |d| Reply.new(d) }
  end

  def self.find_by_subject_question_id(subject_question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, subject_question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        subject_question_id = ?
    SQL
    data.map { |d| Reply.new(d) }
  end

  def self.find_by_parent_reply_id(parent_reply_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, parent_reply_id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply_id = ?
    SQL
    data.map { |d| Reply.new(d) }
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @author_user_id = options['author_user_id']
    @subject_question_id = options['subject_question_id']
    @parent_reply_id = options['parent_reply_id']
  end

  def author
    User.find_by_id(@author_user_id)
  end

  def question
    Question.find_by_id(@subject_question_id)
  end

  def parent_reply
    Reply.find_by_id(@parent_reply_id)
  end

  def child_replies
    Reply.find_by_parent_reply_id(@id)
  end

end
