# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
    SELECT DISTINCT
      physics_years.yr
    FROM (
      SELECT
        yr
      FROM
        nobels
      WHERE
        subject = 'Physics'
    ) physics_years
    LEFT JOIN (
      SELECT
        yr
      FROM
        nobels
      WHERE
        subject = 'Chemistry'
    ) chemistry_years
    ON
      physics_years.yr = chemistry_years.yr
    WHERE
      chemistry_years.yr IS NULL
  SQL
end
