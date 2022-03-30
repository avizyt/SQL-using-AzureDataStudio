select OBJECT_SCHEMA_NAME(o.object_id) schema_name,
	o.name
from sys.objects as o
where o.type = 'V';