# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer

require_relative './sqlzoo.rb'

def example_join
  execute(<<-SQL)
    SELECT
      *
    FROM
      movies
    JOIN
      castings ON movies.id = castings.movie_id
    JOIN
      actors ON castings.actor_id = actors.id
    WHERE
      actors.name = 'Sean Connery'
  SQL
end

def ford_films
  # List the films in which 'Harrison Ford' has appeared.
  execute(<<-SQL)
    SELECT title
    FROM actors a
    JOIN castings c
    ON a.id = c.actor_id
    JOIN movies m
    ON c.movie_id = m.id
    WHERE name = 'Harrison Ford'
  SQL
end

def ford_supporting_films
  # List the films where 'Harrison Ford' has appeared - but not in the star
  # role. [Note: the ord field of casting gives the position of the actor. If
  # ord=1 then this actor is in the starring role]
  execute(<<-SQL)
    SELECT title
    FROM actors a
    JOIN castings c
    ON a.id = c.actor_id
    JOIN movies m
    ON c.movie_id = m.id
    WHERE name = 'Harrison Ford'
    AND ord <> 1
  SQL
end

def films_and_stars_from_sixty_two
  # List the title and leading star of every 1962 film.
  execute(<<-SQL)
    SELECT title, name
    FROM actors a
    JOIN castings c
    ON a.id = c.actor_id
    JOIN movies m
    ON c.movie_id = m.id
    WHERE yr = 1962
    AND ord = 1
  SQL
end

def travoltas_busiest_years
  # Which were the busiest years for 'John Travolta'? Show the year and the
  # number of movies he made for any year in which he made at least 2 movies.
  execute(<<-SQL)
    SELECT *
    FROM (
      SELECT yr, COUNT(*) AS num_movies
      FROM actors a
      JOIN castings c
      ON a.id = c.actor_id
      JOIN movies m
      ON c.movie_id = m.id
      WHERE name = 'John Travolta'
      GROUP BY yr
    ) johns_movies
    WHERE num_movies >= 2
  SQL
end

def andrews_films_and_leads
  # List the film title and the leading actor for all of the films 'Julie
  # Andrews' played in.
  execute(<<-SQL)
    SELECT title, name
    FROM actors a
    JOIN castings c
    ON a.id = c.actor_id
    JOIN (
      SELECT jm.id, jm.title
      FROM actors ja
      JOIN castings jc
      ON ja.id = jc.actor_id
      JOIN movies jm
      ON jc.movie_id = jm.id
      WHERE name = 'Julie Andrews'
    ) julies_movies
    ON c.movie_id = julies_movies.id
    WHERE c.ord = 1
  SQL
end

def prolific_actors
  # Obtain a list in alphabetical order of actors who've had at least 15
  # starring roles.
  execute(<<-SQL)
    SELECT name
    FROM (
      SELECT name, COUNT(*) AS num_starring_roles
      FROM actors sa
      JOIN castings sc
      ON sa.id = sc.actor_id
      WHERE ord = 1
      GROUP BY name
    ) star_actors
    WHERE num_starring_roles >= 15
    ORDER BY name
  SQL
end

def films_by_cast_size
  # List the films released in the year 1978 ordered by the number of actors
  # in the cast (descending), then by title (ascending).
  execute(<<-SQL)
    SELECT title, cast_size
    FROM (
      SELECT csm.title, COUNT(*) AS cast_size
      FROM actors csa
      JOIN castings csc
      ON csa.id = csc.actor_id
      JOIN movies csm
      ON csm.id = csc.movie_id
      WHERE csm.yr = 1978
      GROUP BY csm.title
    ) films_by_cast_size
    ORDER BY cast_size DESC, title
  SQL
end

def colleagues_of_garfunkel
  # List all the people who have played alongside 'Art Garfunkel'.
  execute(<<-SQL)
    SELECT DISTINCT name
    FROM actors a
    JOIN castings c
    ON a.id = c.actor_id
    JOIN (
      SELECT amm.id AS amm_id
      FROM actors ama
      JOIN castings amc
      ON ama.id = amc.actor_id
      JOIN movies amm
      ON amm.id = amc.movie_id
      WHERE name = 'Art Garfunkel'
    ) arts_movies
    ON arts_movies.amm_id = c.movie_id
    WHERE name <> 'Art Garfunkel'
  SQL
end
