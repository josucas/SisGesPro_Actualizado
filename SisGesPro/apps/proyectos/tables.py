import django_tables2 as tables
from .models import UserStory
 
class UsTable(tables.Table):
    class Meta:
        model = UserStory
        template_name = 'django_tables2/bootstrap.html'
