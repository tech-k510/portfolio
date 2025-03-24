import pytest
from app import app  # Flaskアプリケーションをインポート


@pytest.fixture
def client():
    with app.test_client() as client:
        yield client


def test_hello_world(client):
    """'Hello, World!'が返されることを確認するテスト"""
    response = client.get('/')
    assert response.data == b'Hello, World!'
