create_table "region", primary_key: "r_regionkey" do |t|
  t.string "r_name", limit: 25, null: false
  t.string "r_comment", limit: 152
end

create_table "nation", primary_key: "n_nationkey" do |t|
  t.string "n_name", limit: 25, null: false
  t.integer "n_regionkey", null: false
  t.string "n_comment", limit: 152

  t.foreign_key "region", column: "n_regionkey"
end

create_table "customer", primary_key: "c_custkey" do |t|
  t.string "c_name", limit: 25, null: false
  t.string "c_address", limit: 40, null: false
  t.integer "c_nationkey", null: false
  t.string "c_phone", limit: 15, null: false
  t.float "c_acctbal", null: false
  t.string "c_mktsegment", limit: 10, null: false
  t.string "c_comment", limit: 117, null: false

  t.foreign_key "nation", column: "c_nationkey"
end

create_table "supplier", primary_key: "s_suppkey" do |t|
  t.string "s_name", limit: 25, null: false
  t.string "s_address", limit: 40, null: false
  t.integer "s_nationkey", null: false
  t.string "s_phone", limit: 15, null: false
  t.float "s_acctbal", null: false
  t.string "s_comment", limit: 101, null: false

  t.foreign_key "nation", column: "s_nationkey"
end

create_table "part", primary_key: "p_partkey" do |t|
  t.string "p_name", limit: 55, null: false
  t.string "p_mfgr", limit: 25, null: false
  t.string "p_brand", limit: 10, null: false
  t.string "p_type", limit: 25, null: false
  t.integer "p_size", null: false
  t.string "p_container", limit: 10, null: false
  t.float "p_retailprice", null: false
  t.string "p_comment", limit: 23, null: false
end

create_table "partsupp", primary_key: %w[ps_partkey ps_suppkey] do |t|
  t.integer "ps_partkey", null: false
  t.integer "ps_suppkey", null: false
  t.integer "ps_availqty", null: false
  t.float "ps_supplycost", null: false
  t.string "ps_comment", limit: 199, null: false

  t.foreign_key "part", column: "ps_partkey"
  t.foreign_key "supplier", column: "ps_suppkey"
end

create_table "orders", primary_key: "o_orderkey" do |t|
  t.integer "o_custkey", null: false
  t.string "o_orderstatus", limit: 1, null: false
  t.float "o_totalprice", null: false
  t.date "o_orderdate", null: false
  t.string "o_orderpriority", limit: 15, null: false
  t.string "o_clerk", limit: 15, null: false
  t.integer "o_shippriority", null: false
  t.string "o_comment", limit: 79, null: false

  t.foreign_key "customer", column: "o_custkey"
end

create_table "lineitem", primary_key: %w[l_orderkey l_linenumber] do |t|
  t.integer "l_orderkey", null: false
  t.integer "l_partkey", null: false
  t.integer "l_suppkey", null: false
  t.integer "l_linenumber", null: false
  t.float "l_quantity", null: false
  t.float "l_extendedprice", null: false
  t.float "l_discount", null: false
  t.float "l_tax", null: false
  t.string "l_returnflag", limit: 1, null: false
  t.string "l_linestatus", limit: 1, null: false
  t.date "l_shipdate", null: false
  t.date "l_commitdate", null: false
  t.date "l_receiptdate", null: false
  t.string "l_shipinstruct", limit: 25, null: false
  t.string "l_shipmode", limit: 10, null: false
  t.string "l_comment", limit: 44, null: false

  t.foreign_key "orders", column: "l_orderkey"
  t.foreign_key "partsupp", columns: %w[l_partkey l_suppkey]
end
