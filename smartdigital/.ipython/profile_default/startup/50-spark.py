import importlib
pysparksql_spec = importlib.util.find_spec("pyspark.sql")
if pysparksql_spec is not None:
    from pyspark.sql import SparkSession
    spark = SparkSession.builder.getOrCreate()

    def get_dbutils(spark):
      from pyspark.dbutils import DBUtils
      return DBUtils(spark)

    dbutils = get_dbutils(spark)

    # from IPython.core.magic import line_magic, line_cell_magic, Magics, magics_class

    # @magics_class
    # class DatabricksConnectMagics(Magics):

    #    @line_cell_magic
    #    def sql(self, line, cell=None):
    #        if cell and line:
    #            raise ValueError("Line must be empty for cell magic", line)
    #        try:
    #            from autovizwidget.widget.utils import display_dataframe
    #        except ImportError:
    #            print("Please run `pip install autovizwidget` to enable the visualization widget.")
    #            display_dataframe = lambda x: x
    #        return display_dataframe(self.get_spark().sql(cell or line).toPandas())

    #    def get_spark(self):
    #        user_ns = get_ipython().user_ns
    #        if "spark" in user_ns:
    #            return user_ns["spark"]
    #        else:
    #            from pyspark.sql import SparkSession
    #            user_ns["spark"] = SparkSession.builder.getOrCreate()
    #            return user_ns["spark"]

    # ip = get_ipython()
    # ip.register_magics(DatabricksConnectMagics)

    # from IPython.core.display import display, HTML
