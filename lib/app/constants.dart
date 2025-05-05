import 'package:taza/taza.dart';

/// below list is only for development purpose
/// for the cart functionality and will be remove when we integrate apis

List<FoodModel> demoFoodList = [
  FoodModel(
      id: "11",
      name: 'Family Bucket',
      imageUrl: 'https://i.ibb.co/whRS5nY7/b.jpg',
      rating: 4.2,
      reviewsCount: 1200,
      deliveryTime: '30-35 min',
      price: 89.0,
      quantity: 0,
      isVeg: false,
      restaurantName: "KFC"
  ),
  FoodModel(
      id: "12",
      name: 'Cheese Burger',
      imageUrl: 'https://i.ibb.co/FLj0XVLX/burger.webp',
      rating: 4.5,
      reviewsCount: 950,
      deliveryTime: '25-30 min',
      price: 59.0,
      isVeg: true,
      restaurantName: "Burger King"
  ),
  FoodModel(
      id: "13",
      name: 'Chocolate Cake',
      imageUrl: 'https://i.ibb.co/XfpHPXFP/cake.jpg',
      rating: 4.6,
      reviewsCount: 1100,
      deliveryTime: '20-25 min',
      price: 45.0,
      isVeg: true,
      restaurantName: "Chocolate Room"
  ),
  FoodModel(
      id: "14",
      name: 'Chinese Combo',
      imageUrl: 'https://i.ibb.co/HLmQQsjy/chinease.jpg',
      rating: 4.4,
      reviewsCount: 780,
      deliveryTime: '35-40 min',
      price: 65.0,
      isVeg: true,
      restaurantName: "Waka Noodles"
  ),
  FoodModel(
      id: "15",
      name: 'Crispy Fries',
      imageUrl: 'https://i.ibb.co/Wp59vWJz/fries.jpg',
      rating: 4.1,
      reviewsCount: 620,
      deliveryTime: '10-15 min',
      price: 19.0,
      isVeg: true,
      restaurantName: "MacDonald"
  ),

];

List<RestaurantItemModel> demoRestaurantList = [
  RestaurantItemModel(
    id: 1,
    imageUrl: 'https://i.ibb.co/99w2vpzL/Mc-Donalds-Retro.jpg',
    title: 'McDonald\'s',
    rating: 4.4,
    reviews: '15k',
    distance: '1.2 km',
    cuisines: 'Burgers, Fast Food',
    priceForTwo: 500,
    startingPrice: 99,
    deliveryTime: '20-25 min',
    hasCarousel: true,
    time: '20-25 min',
    price: '15',
    logo: 'https://i.ibb.co/mVLbTgrf/macd.png',
    menu: [
      FoodModel(id: "1", name: 'Crispy Veggie Burger', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/12/12/7a3244bf-3091-4ae6-92e3-13be841a753e_b21f7a05-24b3-43f8-a592-beb23e6b69fa.png', rating: 4.2, reviewsCount: 1200, deliveryTime: '30-35 min', price: 89.0, quantity: 0, isVeg: false, restaurantName: "Macdonald"),
      FoodModel(id: "2", name: 'Crispy Veggie Burger Meal (M).', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/9/18/70eb5956-3666-47f4-bcf8-1f5075207222_fd9e2a06-3f27-47e3-88aa-86895ffaa65e.png', rating: 4.3, reviewsCount: 850, deliveryTime: '25-30 min', price: 49.0, quantity: 0, isVeg: false, restaurantName: "Macdonald"),
      FoodModel(id: "3", name: 'Mc Crispy Chicken Burger.', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/3/15/08e9bc73-6774-41cf-96bb-ca817c4e23d3_e00ec89e-86f8-4531-956a-646082dc294c.png', rating: 4.1, reviewsCount: 700, deliveryTime: '20-25 min', price: 39.0, quantity: 0, isVeg: true, restaurantName: "Macdonald"),
    ],
  ),
  RestaurantItemModel(
    id: 2,
    imageUrl: 'https://i.ibb.co/xt5DpLNT/subway-header.jpg',
    title: 'Subway',
    rating: 4.3,
    reviews: '9.8k',
    distance: '1.0 km',
    cuisines: 'Sandwiches, Healthy',
    priceForTwo: 450,
    startingPrice: 129,
    deliveryTime: '15-20 min',
    hasCarousel: false,
    time: '15-20 min',
    price: '8',
    logo: "https://i.ibb.co/5WBN3gyk/subway.jpg",
    menu: [
      FoodModel(id: "4", name: 'Cheesy Paneer Tikka', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2025/3/6/718a859f-14f9-4a6e-80c2-82309982afb5_2d2e8df6-3594-4cab-8d18-2f16c180038f.png', rating: 4.5, reviewsCount: 950, deliveryTime: '25-30 min', price: 59.0, quantity: 0, isVeg: true, restaurantName: "Burger King"),
      FoodModel(id: "5", name: 'Cheesy Chicken Tikka', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2025/3/6/9e6c9ee5-a10f-43a1-8a4d-6592565ab0f5_e301de9a-dda8-4ba7-bbaf-150b29b16c3c.png', rating: 4.6, reviewsCount: 1100, deliveryTime: '30-35 min', price: 79.0, quantity: 0, isVeg: false, restaurantName: "Burger King"),
      FoodModel(id: "6", name: 'Lamb Pepperoni', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/10/22/b5854cd5-4137-43ad-917b-ff606191d51b_c3fec6f5-4d4b-4b34-8619-231346754e8a.png', rating: 4.2, reviewsCount: 700, deliveryTime: '25-30 min', price: 69.0, quantity: 0, isVeg: true, restaurantName: "Burger King"),
      FoodModel(id: "7", name: 'Paneer Tikka Salad', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/8/4/15ed372e-ded6-4824-a4a1-0a961516b64a_e38e8631-1884-45a5-a914-1baf93c7c96c.png', rating: 4.3, reviewsCount: 680, deliveryTime: '15-20 min', price: 35.0, quantity: 0, isVeg: true, restaurantName: "Burger King"),
      FoodModel(id: "8", name: 'Veggie Strips', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/5280b1e4c4c386ce2a4f8ff049e2887d', rating: 4.1, reviewsCount: 530, deliveryTime: '20-25 min', price: 32.0, quantity: 0, isVeg: true, restaurantName: "Burger King"),
    ],
  ),
  RestaurantItemModel(
    id: 3,
    imageUrl: 'https://i.ibb.co/23ZtTcjf/burger-king.jpg',
    title: 'Burger King',
    rating: 4.5,
    reviews: '12k',
    distance: '2.0 km',
    cuisines: 'Burgers, American',
    priceForTwo: 550,
    startingPrice: 119,
    deliveryTime: '20-30 min',
    hasCarousel: false,
    time: '20-30 min',
    price: '12',
    logo: "https://i.ibb.co/hx0vrfw8/burgerking.png",
    menu: [
      FoodModel(id: "10", name: 'Original Whopper Chicken', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/11/29/523da59d-365f-47bc-bb93-5583508104e9_c9077a2b-eab2-4acf-85f0-d7a357c4757a.jpg', rating: 4.4, reviewsCount: 780, deliveryTime: '35-40 min', price: 65.0, quantity: 0, isVeg: true, restaurantName: "Waka Noodles"),
      FoodModel(id: "11", name: 'King Fries', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/3/14/fefae94a-53cd-421c-9f1f-d0f642949728_2ddc8be1-0a65-430d-9de8-542fae4ce739.jpg', rating: 4.5, reviewsCount: 720, deliveryTime: '30-35 min', price: 50.0, quantity: 0, isVeg: true, restaurantName: "Waka Noodles"),
      FoodModel(id: "12", name: 'Crispy Veg Double Patty Burger+Fries(M)', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/2b8b717cfc1d7aac9c1c9d16594735f8', rating: 4.3, reviewsCount: 680, deliveryTime: '20-25 min', price: 35.0, quantity: 0, isVeg: true, restaurantName: "Waka Noodles"),
      FoodModel(id: "13", name: 'Veggie Strips(5 Pcs)', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/4/19/aeac450c-d789-4c00-a593-05e352a5b325_4eab783e-7b7d-4401-b8e4-64b1fba9bbf5.jpg', rating: 4.6, reviewsCount: 800, deliveryTime: '30-35 min', price: 55.0, quantity: 0, isVeg: true, restaurantName: "Waka Noodles"),
      FoodModel(id: "14", name: 'Crispy Veg Combo (M)', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/11/23/7c56cc10-0101-480d-8fcd-1ed6e4622f98_2617b323-c197-4976-a6eb-14c6397c62b2.jpg', rating: 4.4, reviewsCount: 700, deliveryTime: '25-30 min', price: 58.0, quantity: 0, isVeg: true, restaurantName: "Waka Noodles"),
    ],
  ),
  RestaurantItemModel(
    id: 4,
    imageUrl: 'https://i.ibb.co/Pzc05HXZ/dominos.jpg',
    title: 'Domino\'s Pizza',
    rating: 4.6,
    reviews: '18k',
    distance: '2.5 km',
    cuisines: 'Pizza, Fast Food',
    priceForTwo: 600,
    startingPrice: 99,
    deliveryTime: '25-35 min',
    hasCarousel: true,
    time: '25-35 min',
    price: '14',
    logo: "https://i.ibb.co/PZ1BP3TR/dominos.png",
    menu: [
      FoodModel(id: "15", name: 'Peppy Paneer Cheese Burst', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/10/17/a85a5e4f-7a9a-4eb6-b491-dab24001e15c_b2d956ee-4518-4491-8c5a-99eab6db298e.jpg', rating: 4.2, reviewsCount: 1200, deliveryTime: '30-35 min', price: 89.0, quantity: 0, isVeg: false, restaurantName: "KFC"),
      FoodModel(id: "16", name: 'Margherita Cheese Burst', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/10/17/ccc30e06-ab70-45b6-9825-adf3150441af_3f3d3a2e-855b-4158-bcec-7615525e44b0.jpg', rating: 4.3, reviewsCount: 850, deliveryTime: '25-30 min', price: 49.0, quantity: 0, isVeg: false, restaurantName: "KFC"),
      FoodModel(id: "17", name: 'Pizza Party for 4 (Veg) @Rs. 180 Off', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/7/31/99380be1-e010-42b9-ac5f-18eca2c4df13_8817bc9d-8a29-4e7e-ab1f-2be79a8a3441.jpg', rating: 4.1, reviewsCount: 700, deliveryTime: '20-25 min', price: 39.0, quantity: 0, isVeg: false, restaurantName: "KFC"),
      FoodModel(id: "18", name: 'Indi Tandoori Paneer Pizza', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/010b29da595df93d828ca0dca935821a', rating: 4.0, reviewsCount: 620, deliveryTime: '20-25 min', price: 35.0, quantity: 0, isVeg: false, restaurantName: "KFC"),
      FoodModel(id: "19", name: 'Mexican Green Wave Pizza', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/8/2/e3db1171-0df9-4c02-b6eb-ba8423630c71_28876d94-adb0-4cae-a1cd-06ab38b1a31c.jpg', rating: 4.5, reviewsCount: 500, deliveryTime: '15-20 min', price: 29.0, quantity: 0, isVeg: true, restaurantName: "KFC"),
    ],
  ),
  RestaurantItemModel(
    id: 5,
    imageUrl: 'https://i.ibb.co/HLrrqVV6/taco-bell.jpg',
    title: 'Taco Bell',
    rating: 4.3,
    reviews: '8.4k',
    distance: '1.7 km',
    cuisines: 'Mexican, Tacos',
    priceForTwo: 500,
    startingPrice: 109,
    deliveryTime: '20-25 min',
    hasCarousel: false,
    time: '20-25 min',
    price: '13',
    logo: "https://i.ibb.co/0y5YNZK8/tacobell.png",
    menu: [
      FoodModel(id: "20", name: 'Naked Veggie Taco Meal', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/10/15/b25c9f52-ac5e-45f7-9869-3e1691401424_c4fc8760-8299-4c71-bdbb-aa93d87f1bec.png', rating: 4.2, reviewsCount: 1200, deliveryTime: '30-35 min', price: 89.0, quantity: 0, isVeg: false, restaurantName: "KFC"),
      FoodModel(id: "21", name: 'Cheesy Lava Taco (BurgerKiller) Veg Meal Overload', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/8/14/cba8b375-48a2-44c7-b488-03dbe9865891_007208b0-b3ae-4581-9aa4-065afc836cfc.png', rating: 4.3, reviewsCount: 850, deliveryTime: '25-30 min', price: 49.0, quantity: 0, isVeg: false, restaurantName: "KFC"),
      FoodModel(id: "22", name: 'Naked Veggie Taco', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2025/3/31/5b1e78ba-3ae3-42fe-94d5-4f6d2016d1eb_83c946d4-dacf-4a2f-9954-9422dc4a1030.png', rating: 4.1, reviewsCount: 700, deliveryTime: '20-25 min', price: 39.0, quantity: 0, isVeg: false, restaurantName: "KFC"),
      FoodModel(id: "23", name: 'Chicken Strips', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/8/24/16b61d93-a1ed-44b7-9278-e14f487d505d_22668430-0d5e-4932-8fe1-e8afdabe66b3.png', rating: 4.0, reviewsCount: 620, deliveryTime: '20-25 min', price: 35.0, quantity: 0, isVeg: false, restaurantName: "KFC"),
      FoodModel(id: "24", name: '2 Value Rice Bowl Non Veg+1 Small Fries+1 Cinnamon Twists+2 Pepsi Zero', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/8/24/16b61d93-a1ed-44b7-9278-e14f487d505d_22668430-0d5e-4932-8fe1-e8afdabe66b3.png', rating: 4.5, reviewsCount: 500, deliveryTime: '15-20 min', price: 29.0, quantity: 0, isVeg: true, restaurantName: "KFC"),
    ],
  ),
  RestaurantItemModel(
    id: 6,
    imageUrl: 'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
    logo: 'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
    title: 'KFC',
    rating: 4.5,
    reviews: '14k',
    distance: '2.3 km',
    cuisines: 'Chicken, Fast Food',
    priceForTwo: 650,
    startingPrice: 129,
    deliveryTime: '30-40 min',
    hasCarousel: true,
    time: '30-40 min',
    price: '20',
    menu: [
      FoodModel(id: "25", name: 'Indian Tandoori Roll Chicken Meal', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/12/10/6b6f3b25-fed1-4e21-afa4-0810da0f2059_b7efdb4b-1568-47b0-9432-1030f6e7ea31.jpg', rating: 4.2, reviewsCount: 1200, deliveryTime: '30-35 min', price: 89.0, quantity: 0, isVeg: false, restaurantName: "KFC"),
      FoodModel(id: "26", name: 'Spicy Zinger Burger', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/4/13/c399fbf4-8312-48c0-b661-fa2e052845cf_c96b26a6-55c6-43ff-8231-03e6c10cc4b6.jpg', rating: 4.3, reviewsCount: 850, deliveryTime: '25-30 min', price: 49.0, quantity: 0, isVeg: false, restaurantName: "KFC"),
      FoodModel(id: "27", name: 'Chicken Bucket for Two', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/wmn6qpsqazt1ln8hylum', rating: 4.1, reviewsCount: 700, deliveryTime: '20-25 min', price: 39.0, quantity: 0, isVeg: false, restaurantName: "KFC"),
      FoodModel(id: "28", name: '4 Pc Hot & Crispy Pepsi Bottle Combo', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/11/24/dbba9c0a-6724-448a-afec-0e0c76045da4_8c892f8b-6d51-45bd-9fec-8f1906d97a5b.jpg', rating: 4.0, reviewsCount: 620, deliveryTime: '20-25 min', price: 35.0, quantity: 0, isVeg: false, restaurantName: "KFC"),
      FoodModel(id: "29", name: 'Chicken Mingles Bucket Meal', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2024/5/10/083d6310-fd4b-4a15-a546-37d9cc97dc99_0db16331-66f1-483b-afd1-d2c1b326aa62.jpg', rating: 4.5, reviewsCount: 500, deliveryTime: '15-20 min', price: 29.0, quantity: 0, isVeg: true, restaurantName: "KFC"),
    ],
  ),
  RestaurantItemModel(
    id: 7,
    imageUrl: 'https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg',
    title: 'Pizza Hut',
    rating: 4.4,
    reviews: '10.2k',
    distance: '2.1 km',
    cuisines: 'Pizza, Italian',
    priceForTwo: 700,
    startingPrice: 149,
    deliveryTime: '25-30 min',
    hasCarousel: false,
    time: '25-30 min',
    price: '11',
    logo: "https://i.ibb.co/RkYTnFXx/pizzahutt.png",
    menu: [
      FoodModel(id: "31", name: 'Chicken Supreme', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2025/4/16/965b53e7-4839-48d1-a887-13540a78c31d_f3142c0b-d7cc-48cc-b620-7752d86dd795.jpg', rating: 4.2, reviewsCount: 1200, deliveryTime: '30-35 min', price: 89.0, quantity: 0, isVeg: false, restaurantName: "KFC"),
      FoodModel(id: "32", name: 'Triple Chicken Feast', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2025/4/16/0d0300d1-65e2-4102-b275-b1db003a6e56_f752e6cd-3a83-47a2-a6d6-97d2c4c19402.jpg', rating: 4.3, reviewsCount: 850, deliveryTime: '25-30 min', price: 49.0, quantity: 0, isVeg: false, restaurantName: "KFC"),
      FoodModel(id: "33", name: 'Murg Malai Chicken', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2025/4/16/d13cbf3c-bea0-44aa-8fe8-3d52e7f4b5fa_819c0696-a813-4e36-aee7-c78410473a6f.jpg', rating: 4.1, reviewsCount: 700, deliveryTime: '20-25 min', price: 39.0, quantity: 0, isVeg: false, restaurantName: "KFC"),
      FoodModel(id: "34", name: 'Classic Herbed Chicken & Capsicum', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2025/4/16/462050dd-4a7c-4e38-8b6e-ec17aba8a623_c41d2279-5e5d-45e7-8ac2-52ddd87086bf.jpg', rating: 4.0, reviewsCount: 620, deliveryTime: '20-25 min', price: 35.0, quantity: 0, isVeg: false, restaurantName: "KFC"),
      FoodModel(id: "35", name: 'Margherita', imageUrl: 'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_300,c_fit/FOOD_CATALOG/IMAGES/CMS/2025/4/17/ef2f1053-c8e3-4072-aaa7-4539a67c8554_e8da5065-4d03-47d7-bad7-5413398a1564.jpg_compressed', rating: 4.5, reviewsCount: 500, deliveryTime: '15-20 min', price: 29.0, quantity: 0, isVeg: true, restaurantName: "KFC"),
    ],
  ),
];

/// Below method is used to show random items in our app
/// this is only for testing purpose.
List<FoodModel> getRandomMenuItems(int length) {
  final allMenuItems = demoRestaurantList.expand((restaurant) => restaurant.menu).toList();
  final random = Random();

  if (length >= allMenuItems.length) {
    return allMenuItems;
  }

  final selected = <FoodModel>{};
  while (selected.length < length) {
    final item = allMenuItems[random.nextInt(allMenuItems.length)];
    selected.add(item);
  }

  return selected.toList();
}