require 'pg'

def persisted_data(id:)
  con = PG.connect(dbname: 'chitter_test')
  data = con.query("SELECT * FROM users WHERE id = #{id};")
  data.first
end

def persisted_peep_data(id:)
  con = PG.connect(dbname: 'chitter_test')
  data = con.query("SELECT * FROM peeps WHERE id = #{id};")
  data.first
end
