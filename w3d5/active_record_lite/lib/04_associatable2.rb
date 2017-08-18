require_relative '03_associatable'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name) # home, human, house
    define_method(name) do # home
      through_options = self.class.assoc_options[through_name] #{class_name: Human, primary_key: id, foreign_key: human_id}
      source_options = through_options.model_class.assoc_options[source_name] #{class_name: House, primary_key: id, foreign_key: house_id}
      through_table = through_options.model_class.table_name
      source_table = source_options.model_class.table_name

      data = DBConnection.execute(<<-SQL, )
        SELECT
          #{source_table}.*
        FROM
          #{table_name}
        JOIN
          #{through_table}
        ON
          #{table_name}.#{through_options.foreign_key} = #{through_table}.#{through_options.primary_key}
        JOIN
          #{source_table}
        ON
          #{through_table}.#{source_options.foreign_key} = #{source_table}.#{source_options.primary_key}
      SQL
      data.empty? ? nil : source_options.model_class.new(data.first)
    end
  end
end
