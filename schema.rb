ActiveRecord::Schema[8.0].define(version: 2025_04_15_000000) do
  create_table "region", primary_key: "r_regionkey", force: :cascade do |t|
    t.string "r_name", limit: 25, null: false
    t.string "r_comment", limit: 152
  end

  create_table "nation", primary_key: "n_nationkey", force: :cascade do |t|
    t.string "n_name", limit: 25, null: false
    t.integer "n_regionkey", null: false
    t.string "n_comment", limit: 152
    t.index ["n_regionkey"], name: "index_nation_on_regionkey"
  end

  create_table "customer", primary_key: "c_custkey", force: :cascade do |t|
    t.string "c_name", limit: 25, null: false
    t.string "c_address", limit: 40, null: false
    t.integer "c_nationkey", null: false
    t.string "c_phone", limit: 15, null: false
    t.float "c_acctbal", null: false
    t.string "c_mktsegment", limit: 10, null: false
    t.string "c_comment", limit: 117, null: false
    t.index ["c_nationkey"], name: "index_customer_on_nationkey"
  end

  create_table "supplier", primary_key: "s_suppkey", force: :cascade do |t|
    t.string "s_name", limit: 25, null: false
    t.string "s_address", limit: 40, null: false
    t.integer "s_nationkey", null: false
    t.string "s_phone", limit: 15, null: false
    t.float "s_acctbal", null: false
    t.string "s_comment", limit: 101, null: false
    t.index ["s_nationkey"], name: "index_supplier_on_nationkey"
  end

  create_table "part", primary_key: "p_partkey", force: :cascade do |t|
    t.string "p_name", limit: 55, null: false
    t.string "p_mfgr", limit: 25, null: false
    t.string "p_brand", limit: 10, null: false
    t.string "p_type", limit: 25, null: false
    t.integer "p_size", null: false
    t.string "p_container", limit: 10, null: false
    t.float "p_retailprice", null: false
    t.string "p_comment", limit: 23, null: false
  end

  create_table "partsupp", id: false, force: :cascade do |t|
    t.integer "ps_partkey", null: false
    t.integer "ps_suppkey", null: false
    t.integer "ps_availqty", null: false
    t.float "ps_supplycost", null: false
    t.string "ps_comment", limit: 199, null: false
    t.index ["ps_partkey"], name: "index_partsupp_on_partkey"
    t.index ["ps_suppkey"], name: "index_partsupp_on_suppkey"
  end

  create_table "orders", primary_key: "o_orderkey", force: :cascade do |t|
    t.integer "o_custkey", null: false
    t.string "o_orderstatus", limit: 1, null: false
    t.float "o_totalprice", null: false
    t.date "o_orderdate", null: false
    t.string "o_orderpriority", limit: 15, null: false
    t.string "o_clerk", limit: 15, null: false
    t.integer "o_shippriority", null: false
    t.string "o_comment", limit: 79, null: false
    t.index ["o_custkey"], name: "index_orders_on_custkey"
  end

  create_table "lineitem", id: false, force: :cascade do |t|
    t.integer "l_orderkey", null: false
    t.integer "l_linenumber", null: false
    t.integer "l_partkey", null: false
    t.integer "l_suppkey", null: false
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
    t.index ["l_orderkey"], name: "index_lineitem_on_orderkey"
    t.index ["l_partkey"], name: "index_lineitem_on_partkey"
    t.index ["l_suppkey"], name: "index_lineitem_on_suppkey"
  end

  # Foreign Keys
  add_foreign_key "nation", "region", column: "n_regionkey"
  add_foreign_key "customer", "nation", column: "c_nationkey"
  add_foreign_key "supplier", "nation", column: "s_nationkey"
  add_foreign_key "orders", "customer", column: "o_custkey"
  add_foreign_key "partsupp", "part", column: "ps_partkey"
  add_foreign_key "partsupp", "supplier", column: "ps_suppkey"
  add_foreign_key "lineitem", "orders", column: "l_orderkey"
  add_foreign_key "lineitem", "part", column: "l_partkey"
  add_foreign_key "lineitem", "supplier", column: "l_suppkey"
end
