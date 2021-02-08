from django.http import HttpResponse, JsonResponse 
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from foodjournal.models import FoodJournal, FoodLogItem, User
from foodjournal.serializers import FoodJournalSerializer, FoodLogItemSerializer, UserSerializer

# from rest_framework import status 
# from rest_framework.decorators import api_view
# from rest_framework.response import Response 
# from foodjournal.models import FoodJournal, FoodLogItem, User
# from foodjournal.serializers import FoodJournalSerializer, FoodLogItemSerializer, UserSerializer

# @api_view(['GET', 'POST'])
@csrf_exempt
def food_journal_entry_list(request):
    """
    List all journal entries or create a new entry
    """

    if request.method == 'GET':
        entries = FoodJournal.objects.all()
        serializer = FoodJournalSerializer(entries, many=True)
        return JsonResponse(serializer.data, safe=False)
    elif request.method == 'POST':
        data = JSONParser().parse(request)
        serializer =  FoodJournalSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=201)
        return Response(serializer.errors, status=400)

# @api_view(['GET', 'PUT', 'DELETE'])
@csrf_exempt
def food_journal_entry_detail(request, pk):
    """
    Retrieve, update or delete a journal entry instance
    """
    try:
        entry = FoodJournal.objects.get(pk=pk)
    except FoodJournal.DoesNotExist:
        return HttpResponse(status=404)

    if request.method == 'GET':
        serializer = FoodJournalSerializer(entry)
        return JsonResponse(serializer.data)
    elif request.method == 'PUT':
        data = JSONParser().parse(request)
        serializer = FoodJournalSerializer(entry, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data)
        return JsonResponse(serializer.errors, status=400)
    elif request.method == 'DELETE':
        entry.delete()
        return Response(status=204)

@csrf_exempt
# @api_view(['GET', 'POST'])
def food_log_item_list(request):
    """
    List all journal entries or create a new entry
    """

    if request.method == 'GET':
        foods = FoodLogItem.objects.all()
        serializer = FoodLogItemSerializer(foods, many=True)
        return JsonResponse(serializer.data, safe=False)
    elif request.method == 'POST':
        data = JSONParser().parse(request)
        serializer =  FoodLogItemSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=201)
        return Response(serializer.errors, status=400)

# @api_view(['GET', 'PUT', 'DELETE'])
@csrf_exempt
def food_log_item_detail(request, pk):
    """
    Retrieve, update or delete a journal entry instance
    """
    try:
        food = FoodLogItem.objects.get(pk=pk)
    except FoodLogItem.DoesNotExist:
        return HttpResponse(status=404)

    if request.method == 'GET':
        serializer = FoodLogItemSerializer(food)
        return JsonResponse(serializer.data)
    elif request.method == 'PUT':
        data = JSONParser().parse(request)
        serializer = FoodLogItemSerializer(food, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data)
        return JsonResponse(serializer.errors, status=400)
    elif request.method == 'DELETE':
        food.delete()
        return Response(status=204)

@csrf_exempt
# @api_view(['GET', 'POST'])
def user_list(request):
    """
    List all users or create a new user
    """

    if request.method == 'GET':
        users = User.objects.all()
        serializer = UserSerializer(users, many=True)
        return JsonResponse(serializer.data, safe=False)
    elif request.method == 'POST':
        data = JSONParser().parse(request)
        serializer =  UserSerializer(datadata)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=201)
        return Response(serializer.errors, status=400)

# @api_view(['GET', 'PUT', 'DELETE'])
@csrf_exempt
def user_detail(request, pk):
    """
    Retrieve, update or delete a user instance
    """
    try:
        user = FoodLogItem.objects.get(pk=pk)
    except FoodLogItem.DoesNotExist:
        return HttpResponse(status=404)

    if request.method == 'GET':
        serializer = UserSerializer(food)
        return JsonResponse(serializer.data)
    elif request.method == 'PUT':
        data = JSONParser().parse(request)
        serializer = UserSerializer(user, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data)
        return JsonResponse(serializer.errors, status=400)
    elif request.method == 'DELETE':
        user.delete()
        return Response(status=204)

# class food_log_items(mixins.ListModelMixin, mixins.CreateModelMixin, generics.GenericAPIView):
#     queryset = FoodLogItem.objects.all()
#     serializer_class = FoodLogItemSerializer

#     def get(self, request, *args, **kwargs):
#         return self.list(request, *args, **kwargs)

#     def post(self, request, *args, **kwargs):
#         return self.create(request, *args, **kwargs)

# class food_log_item_detail(mixins.RetrieveModelMixin,mixins.UpdateModelMixin,mixins.DestroyModelMixin,generics.GenericAPIView):
#     queryset = FoodLogItem.objects.all()
#     serializer_class = FoodLogItemSerializer

#     def get(self, request, *args, **kwargs):
#         return self.retrieve(request, *args, **kwargs)

#     def put(self, request, *args, **kwargs):
#         return self.update(request, *args, **kwargs)

#     def delete(self, request, *args, **kwargs):
#         return self.destroy(request, *args, **kwargs)    



