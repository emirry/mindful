# from django.http import HttpResponse, JsonResponse 
# from django.views.decorators.csrf import csrf_exempt
# from rest_framework.parsers import JSONParser
# from foodjournal.models import FoodJournal, FoodLogItem, User
# from foodjournal.serializers import FoodJournalSerializer, FoodLogItemSerializer, UserSerializer
from rest_framework import status 
from rest_framework.decorators import api_view
from rest_framework.response import Response 
from foodjournal.models import FoodJournal, FoodLogItem, User
from foodjournal.serializers import FoodJournalSerializer, FoodLogItemSerializer, UserSerializer

# from foodjournal.models import FoodJournal
# from foodjournal.serializers import FoodJournalSerializer, FoodLogItemSerializer, UserSerializer
# # from rest_framework import mixins
# from rest_framework import generics 

@api_view(['GET', 'POST'])
# @csrf_exempt
def food_journal_entry_list(request):
    """
    List all journal entries or create a new entry
    """
    # queryset = FoodJournal.objects.all()
    # serializer_class = FoodJournalSerializer

    # def get(self, request, *args, **kwargs):
    #     return self.list(request, *args, **kwargs)

    # def post(self, request, *args, **kwargs):
    #     return self.create(request, *args, **kwargs)

    # def get(self, request, format=None):
    #     entries = FoodJournal.objects.all()
    #     serializer = FoodJournalSerializer(entries, many=True)
    #     return Response(serializer.data)

    # def post(self, request, format=None):
    #     serializer = FoodJournalSerializer(data=request.data)
    #     if serializer.isValid():
    #         serializer.save()
    #         return Response(serializer.data, status=status.HTTP_201_CREATED)
    #     return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    if request.method == 'GET':
        entries = FoodJournal.objects.all()
        serializer = FoodJournalSerializer(entries, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        # data = JSONParser().parse(request)
        serializer = FoodJournalSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
# @csrf_exempt
def food_journal_entry_detail(request, pk):
    """
    Retrieve, update or delete a journal entry instance
    """
    # queryset = FoodJournal.objects.all()
    # serializer_class = FoodJournalSerializer 

    # def get(self, request, *args, **kwargs):
    #     return self.retrieve(request, *args, **kwargs)

    # def put(self, request, *args, **kwargs):
    #     return self.update(request, *args, **kwargs)
    
    # def delete(self, request, *args, **kwargs):
    #     return self.destroy(request, *args, **kargs)
        

    # def get_object(self, pk):
    #     try:
    #         return FoodJournal.objects.get(pk=pk)
    #     except FoodJournal.DoesNotExist:
    #         raise Http404

    # def get(self, request, pk, format=None):
    #     entry = self.get_object(pk)
    #     serializer = FoodJournalSerializer(entry)
    #     return Response(serializer.data)

    # def put(self, request, pk, format=None):
    #     entry = self.get_object(pk)
    #     serializer = FoodJournalSerializer(entry, data=request.data)
    #     if serializer.is_valid():
    #         serializer.save()
    #         return Response(serializer.data)
    #     return Response(serializer.errors, stats=status.HTTP_400_BAD_REQUEST)

    # def delete(self, request, pk, format=None):
    #     entry = self.get_object(pk)
    #     entry.delete()
    #     return Response(status=status.HTTP_204_NO_CONTENT)

    try:
        entry = FoodJournal.objects.get(pk=pk)
    except FoodJournal.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = FoodJournalSerializer(entry)
        return Response(serializer.data)
    elif request.method == 'PUT':
        # data = JSONParser().parse(request)
        serializer = FoodJournalSerializer(entry, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        entry.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

# @csrf_exempt
@api_view(['GET', 'POST'])
def food_log_item_list(request):
    """
    List all journal entries or create a new entry
    # """
    # queryset = FoodLogItem.objects.all()
    # serializer_class = FoodLogItemSerializer

    if request.method == 'GET':
        foods = FoodLogItem.objects.all()
        serializer = FoodLogItemSerializer(foods, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        # data = JSONParser().parse(request)
         serializer = FoodLogItemSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    

@api_view(['GET', 'PUT', 'DELETE'])
# @csrf_exempt
def food_log_item_detail(request, pk):
    """
    Retrieve, update or delete a journal entry instance
    """
    # queryset = FoodLogItem.objects.all()
    # serializer_class = FoodLogItemSerializer

    # def get_object(self, pk):
    #     try:
    #         return FoodLogItem.objects.get(pk=pk)
    #     except FoodLogItem.DoesNotExist:
    #         raise Http404

    # def get(self, request, pk, format=None):
    #     food = self.get_object(pk)
    #     serializer = FoodLogtItemSerializer(food)
    #     return Response(serializer.data)

    # def put(self, request, pk, format=None):
    #     food = self.get_object(pk)
    #     serializer = FoodLogtItemSerializer(food, data=request.data)
    #     if serializer.is_valid():
    #         serializer.save()
    #         return Response(serializer.data)
    #     return Response(serializer.errors, stats=status.HTTP_400_BAD_REQUEST)

    # def delete(self, request, pk, format=None):
    #     food = self.get_object(pk)
    #     food.delete()
    #     return Response(status=status.HTTP_204_NO_CONTENT)
    
    try:
        food = FoodLogItem.objects.get(pk=pk)
    except FoodLogItem.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = FoodLogItemSerializer(food)
        return Response(serializer.data)
    elif request.method == 'PUT':
        # data = JSONParser().parse(request)
        serializer = FoodLogItemSerializer(food, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        food.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

# @csrf_exempt
@api_view(['GET', 'POST'])
def user_list(request):
    """
    List all users or create a new user
    """
    # queryset = User.objects.all()
    # serializer_class = UserSerializer

    # def get(self, request, format=None):
    #     users = User.objects.all()
    #     serializer = UserSerializer(users, many=True)
    #     return Response(serializer.data)

    # def post(self, request, format=None):
    #     serializer = UserSerializer(data=request.data)
    #     if serializer.isValid():
    #         serializer.save()
    #         return Response(serializer.data, status=status.HTTP_201_CREATED)
    #     return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


    if request.method == 'GET':
        users = User.objects.all()
        serializer = UserSerializer(users, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        # data = JSONParser().parse(request)
        serializer =  UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
# @csrf_exempt
def user_detail(request, pk):
    """
    Retrieve, update or delete a user instance
    """
    # queryset = User.objects.all()
    # serializer_class = UserSerializer

    # def get_object(self, pk):
    #     try:
    #         return User.objects.get(pk=pk)
    #     except User.DoesNotExist:
    #         raise Http404

    # def get(self, request, pk, format=None):
    #     user = self.get_object(pk)
    #     serializer = UserSerializer(user)
    #     return Response(serializer.data)

    # def put(self, request, pk, format=None):
    #     user = self.get_object(pk)
    #     serializer = UserSerializer(user, data=request.data)
    #     if serializer.is_valid():
    #         serializer.save()
    #         return Response(serializer.data)
    #     return Response(serializer.errors, stats=status.HTTP_400_BAD_REQUEST)

    # def delete(self, request, pk, format=None):
    #     user = self.get_object(pk)
    #     user.delete()
    #     return Response(status=status.HTTP_204_NO_CONTENT)

    try:
        user = User.objects.get(pk=pk)
    except FoodLogItem.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = UserSerializer(user)
        return Response(serializer.data)
    elif request.method == 'PUT':
        # data = JSONParser().parse(request)
        serializer = UserSerializer(user, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        user.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)



