from django.contrib import admin
from .models import Families, Family, Films, Users, \
            UsersMarks, UsersPurchases, History, Subscribe, \
            SubsUsers, Purchases

for model in [Families, Family, Films, Users, \
            UsersMarks, UsersPurchases, History, Subscribe, \
            SubsUsers, Purchases]:
    admin.site.register(model)
