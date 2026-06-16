class Restaurant {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final int deliveryTimeInMinutes;
  final String cuisine;
  final double deliveryFee;

  const Restaurant({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.deliveryTimeInMinutes,
    required this.cuisine,
    required this.deliveryFee,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json['id'],
        name: json['name'],
        imageUrl: json['imageUrl'],
        rating: json['rating'].toDouble(),
        deliveryTimeInMinutes: json['deliveryTimeInMinutes'],
        cuisine: json['cuisine'],
        deliveryFee: json['deliveryFee'].toDouble(),
      );
}

class MenuItem {
  final String id;
  final String restaurantId;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  const MenuItem({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

const sampleRestaurants = [
  Restaurant(
    id: '1',
    name: 'Burger King Plaza',
    imageUrl: 'https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=800',
    rating: 4.5,
    deliveryTimeInMinutes: 25,
    cuisine: 'Fast Food',
    deliveryFee: 2.50,
  ),
  Restaurant(
    id: '2',
    name: 'Sushi Zen',
    imageUrl: 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=800',
    rating: 4.8,
    deliveryTimeInMinutes: 40,
    cuisine: 'Japanese',
    deliveryFee: 5.00,
  ),
  Restaurant(
    id: '3',
    name: 'Pizza Romana',
    imageUrl: 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=800',
    rating: 4.3,
    deliveryTimeInMinutes: 30,
    cuisine: 'Italian',
    deliveryFee: 3.00,
  ),
];

const sampleMenuItems = [
  MenuItem(
    id: 'm1',
    restaurantId: '1',
    name: 'Classic Whopper',
    description: 'Flame-grilled beef patty with juicy tomatoes, fresh lettuce, and creamy mayo.',
    price: 8.99,
    imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500',
  ),
  MenuItem(
    id: 'm2',
    restaurantId: '1',
    name: 'Bacon King',
    description: 'Two quarter-pound flame-grilled beef patties, topped with thick-cut smoked bacon.',
    price: 10.99,
    imageUrl: 'https://images.unsplash.com/photo-1553979459-d2229ba7433b?w=500',
  ),
  MenuItem(
    id: 'm3',
    restaurantId: '2',
    name: 'Salmon Nigiri',
    description: 'Fresh salmon slices over pressed vinegared rice.',
    price: 12.50,
    imageUrl: 'https://images.unsplash.com/photo-1583623025817-d180a2221d0a?w=500',
  ),
];
