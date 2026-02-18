import unittest
from app import version

class TestAppVersion(unittest.TestCase):
    def test_version_is_correct(self):
        self.assertEqual(version(), "1.0.0")

if __name__ == '__main__':
    unittest.main()
