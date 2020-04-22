from django.test import SimpleTestCase
from django.urls import reverse, resolve
from analysis.views import getAPIKey,getData,getSentiment,listing,details,add,delete,update

class TestUrls(SimpleTestCase):
    
    def test_list_url_is_resolved01(self):
        url = reverse('analysis-listing')
        self.assertEqual(resolve(url).func, listing)
        
    def test_list_url_is_resolved02(self):
        url = reverse('analysis-details')
        self.assertEqual(resolve(url).func, details)

    def test_list_url_is_resolved03(self):
        url = reverse('add')
        self.assertEqual(resolve(url).func, add)
        
    def test_list_url_is_resolved04(self):
        url = reverse('delete')
        self.assertEqual(resolve(url).func, delete)
        
    def test_list_url_is_resolved05(self):
        url = reverse('update')
        self.assertEqual(resolve(url).func, update)