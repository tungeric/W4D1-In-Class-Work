require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    table_name = self.table_name
    data = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL

    @columns = data.first.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |col|
      # getter
      define_method(col) do
        attributes[col]
      end

      #setter
      define_method("#{col}=") do |new_val|
        attributes[col] = new_val
      end

    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || ActiveSupport::Inflector.tableize(self.to_s)
  end

  def self.all
    data = DBConnection.execute(<<-SQL)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
    SQL

    self.parse_all(data)
  end

  def self.parse_all(results)
    results.map { |params| self.new(params) }
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    self.class.finalize!

    params.each do |col, val|
      col = col.to_sym

      if self.class.columns.include?(col)
        self.send("#{col}=", val)
      else
        raise "unknown attribute '#{col}'"
      end

    end

  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
