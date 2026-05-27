import 'dart:convert';

int winCounter = 2;
int requestCounter = 0;

const int playNowPointAmount = 20;
const int flipAnotherPointAmount = 20;
const int flipAnotherHeartAmount = 1;

Map<String, dynamic> userInfo = {
  "level_point": 9999,
  "wing_point": 20,
  "heart": 0,
  "daily_chance_used": true,
  "level_up_shown": true,
  "next_chance_in": 1746065025000,
};

List<Map<String, dynamic>> prizes = [
  {
    "id": "heart",
    "name": "x11",
    "amount": 11,
    "title": "Eleven Hearts",
    "description": "Play Again using Heart",
    "sub_description": "Exclusively on Wing Bank App",
    "image_url_card": "heart",
    "image_url_win": "heart",
    "detail": null,
    "extra_buttons": [
      {"text": "Get on Wingmall", "url": "get_on_wingmall?id=gift_mug"},
      {"text": "Get It Now", "url": "get_it_now?id=gift_mug"},
    ],
    "brand": {"name": "Wing Bank", "logo_url": "wing_logo"},
    "type": "heart",
    "tier": 2,
    "is_giftable": false,
  },
  {
    "id": "gift_mug",
    "name": "Gift",
    "amount": 0,
    "title": "Wing Mug",
    "description": "A gift from Wing Bank",
    "sub_description": "4km From You",
    "image_url_card":
        "https://my-gateway-cwnt86rf.an.gateway.dev/api/v1/proxy-image?url=https%3A%2F%2Fstorage.googleapis.com%2Fwingreward%2Fmedia%252FGlass-1718077048331.png",
    "image_url_win":
        "https://my-gateway-cwnt86rf.an.gateway.dev/api/v1/proxy-image?url=https%3A%2F%2Fstorage.googleapis.com%2Fwingreward%2Fmedia%252FGlass-1718077048331.png",
    "detail": {"title": "View Details", "url": "view_details?id=gift_mug"},
    "extra_buttons": [
      {"text": "Get on Wingmall", "url": "get_on_wingmall?id=gift_mug"},
      {"text": "Get It Now", "url": "get_it_now?id=gift_mug"},
    ],
    "brand": {"name": "Wing Bank", "logo_url": "wing_logo"},
    "type": "physical",
    "tier": 1,
    "is_giftable": true,
  },
  {
    "id": "wingpoint_1000",
    "name": "1000",
    "amount": 1000,
    "title": "1000 Points",
    "description": "You've Won",
    "sub_description": "Exclusively on Wing Bank App",
    "image_url_card": "coins",
    "image_url_win": "coins",
    "detail": null,
    "extra_buttons": [],
    "brand": {"name": "Wing Bank", "logo_url": "wing_logo"},
    "type": "wingpoint",
    "tier": 1,
    "is_giftable": false,
  },
  {
    "id": "iphone",
    "name": "Yummy Burger",
    "title": "Yummy Burger",
    "description": "Yummy Burger",
    "sub_description": "",
    "image_url_card":
        "https://production-treasure-hunt-api-m6yyjeglfq-as.a.run.app/api/v1/proxy-image?url=https%3A%2F%2Fstorage-stage.winginnovation.com%2Fpv%2520missing.png",
    "image_url_win":
        "https://storage-stage.winginnovation.com/pv%20missing.png",
    "detail": {"title": "View Details", "url": "view_details?id=gift_mug"},
    "extra_buttons": [
      {"text": "Get on Wingmall", "url": "get_on_wingmall?id=gift_mug"},
      {"text": "Get It Now", "url": "get_it_now?id=gift_mug"},
    ],
    "brand": {"name": "Wing Bank", "logo_url": "wing_logo"},
    "type": "unclaimable",
    "tier": 1,
  },
  {
    "id": "data",
    "name": "3GB Data",
    "amount": 0,
    "title": "3GB Data",
    "description": "You've won",
    "sub_description": "Exclusively on Wing Bank App",
    "image_url_card": "thank_you",
    "image_url_win": "thank_you",
    "detail": null,
    "extra_buttons": [],
    "brand": {"name": "Wing Bank", "logo_url": "wing_logo"},
    "type": "claimable",
    "tier": 1,
    "is_giftable": false,
  },
  {
    "id": "wingpoint_10",
    "name": "10",
    "amount": 10,
    "title": "10 Points",
    "description": "You've Won",
    "sub_description": "Exclusively on Wing Bank App",
    "image_url_card": "coins",
    "image_url_win": "coins",
    "detail": null,
    "extra_buttons": [],
    "brand": {"name": "Wing Bank", "logo_url": "wing_logo"},
    "type": "wingpoint",
    "tier": 1,
    "is_giftable": false,
  },
];

Map<String, dynamic> gameData = {
  "login": {
    "error": null,
    "user_info": {
      "level_point": 10,
      "level_up_shown": true,
      "wing_point": 10,
      "heart": 0,
      "daily_chance_used": false,
      "next_chance_in": 0,
      "current_level": 0,
    },
    "prices": {
      "play_now": playNowPointAmount,
      "flip_another": flipAnotherPointAmount,
      "heart": flipAnotherHeartAmount,
    },
    "invite": {"active": true, "text": "Share with your friends"},
    "settings": {
      "max_gold_point": 0,
      "screen_name": "flip_card",
      "levels": [
        {
          "min_point": 0,
          "max_point": 5000,
          "title": "The Hatching Ground",
          "description": "Earn 2,000 more Wingpoints to crack the egg",
          "sub_description": "200 more points to hatch",
          "completed_level":
              "Welcome, Your first mission is to hatch your first egg.",
        },
        {
          "min_point": 0,
          "max_point": 10000,
          "title": "The Baby Bird",
          "description":
              "Earn 200 coins to feed the bird. Earn 200 coins to feed the bird.",
          "sub_description": "200 more points to grow",
          "completed_level":
              "You've been doing a great job. Next mission is to feed the bird and grow bigger.",
        },
        {
          "min_point": 0,
          "max_point": 15000,
          "title": "The Flightless Bird",
          "description": "Earn 1 coins to fly",
          "sub_description": "200 more points to fly",
          "completed_level":
              "You've been doing a great job. Next mission is to grow your wings to fly.",
        },
        {
          "min_point": 0,
          "max_point": 15000,
          "title": "Soaring the Skies",
          "description": "You are among the few to fly",
          "sub_description": "",
          "completed_level": "Good job! You are among the few to fly.",
        },
      ],
    },
    "gift": null,
  },
  "shop": {
    "error": null,
    "items": [
      {"id": 1, "amount": 1, "price": 8, "original_price": 10},
      {"id": 2, "amount": 3, "price": 30, "original_price": 30},
      {"id": 3, "amount": 5, "price": 50, "original_price": 50},
      {"id": 4, "amount": 10, "price": 100, "original_price": 100},
      {"id": 5, "amount": 20, "price": 200, "original_price": 200},
      {"id": 6, "amount": 100, "price": 450, "original_price": 500},
    ],
  },
  "buy_heart": {"error": null, "user_info": userInfo},
  "play_now": {
    "error": null,
    "user_info": userInfo,
    "random_text_play": {
      "title": "Unlock Your Surprise",
      "sub_title": "Unlock the box for a prize! 🎁",
    },
    "big_prizes": [
      {
        "image_url":
            "https://my-gateway-cwnt86rf.an.gateway.dev/api/v1/proxy-image?url=https%3A%2F%2Fstorage.googleapis.com%2Fwingreward%2Fmedia%2Fbig_prize_coin-1730097352732.png",
      },
      {
        "image_url":
            "https://my-gateway-cwnt86rf.an.gateway.dev/api/v1/proxy-image?url=https%3A%2F%2Fstorage.googleapis.com%2Fwingreward%2Fmedia%252FGlass-1718077048331.png",
      },
      {
        "image_url":
            "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRzrrvlp_X8HVM4T4EA-L_YS02yp_nCu1KYn7gWEnxWdT1BLjsIQjbwFXdprCpI5pUu58djDsFFYC5t14AJ8D6u3-UjUjT0V30lBXCQayrJ-J6IhK6J_dXuVLoTUIh3XjWJ8J5QqQ&usqp=CAc",
      },
    ],
  },
  "flip_card": {
    "error": null,
    "win_prize_id": "wingpoint",
    "user_info": userInfo,
    "prizes": prizes,
    "win_prize": {
      "id": "gift_mug",
      "name": "Gift",
      "amount": 0,
      "title": "Wing Mug",
      "description": "A gift from Wing Bank",
      "sub_description": "4km From You",
      "image_url_card":
          "https://my-gateway-cwnt86rf.an.gateway.dev/api/v1/proxy-image?url=https%3A%2F%2Fstorage.googleapis.com%2Fwingreward%2Fmedia%252FGlass-1718077048331.png",
      "image_url_win":
          "https://my-gateway-cwnt86rf.an.gateway.dev/api/v1/proxy-image?url=https%3A%2F%2Fstorage.googleapis.com%2Fwingreward%2Fmedia%252FGlass-1718077048331.png",
      "detail": {"title": "View Details", "url": "view_details?id=gift_mug"},
      "extra_buttons": [
        {"text": "Get on Wingmall", "url": "get_on_wingmall?id=gift_mug"},
        {"text": "Get It Now", "url": "get_it_now?id=gift_mug"},
      ],
      "brand": {"name": "Wing Bank", "logo_url": "wing_logo"},
      "type": "physical",
      "tier": 1,
      "is_giftable": true,
    },
  },
  "flip_another": {"error": null, "user_info": userInfo},
  "play_again": {"error": null, "user_info": userInfo},
};

Future<Map<String, dynamic>?> onSurpriseBoxFunctionRequest({
  required String function,
  required dynamic data,
}) async {
  final Map<String, dynamic> jsonBody = data is Map<String, dynamic>
      ? data
      : <String, dynamic>{};
  // data.isNotEmpty ? Map<String, dynamic>.from(jsonDecode(data)) : <String, dynamic>{};

  await Future.delayed(const Duration(milliseconds: 100));

  switch (function) {
    case 'login':
      return gameData['login'];

    case 'close-level-up':
      userInfo['level_up_shown'] = true;
      return null;

    case 'shop':
      return gameData['shop'];

    case 'play-now':
      if (jsonBody['method'] == 'free') {
        userInfo['daily_chance_used'] = true;
      } else if (jsonBody['method'] == 'wingpoint') {
        userInfo['wing_point'] -= playNowPointAmount;
      }
      return gameData['play_now'];

    case 'play-now-with-heart':
      userInfo['heart'] -= playNowPointAmount;
      return gameData['play_now'];

    case 'play-now-with-point':
      userInfo['wing_point'] -= playNowPointAmount;
      return gameData['play_now'];

    case 'flip-card':
      final prizeList = gameData['flip_card']['prizes'] as List;

      if (winCounter == 0) {
        const winId = 'wingpoint_10';
        gameData['flip_card']['win_prize_id'] = winId;

        final prize = prizeList.firstWhere((prize) => prize['id'] == winId);
        userInfo['level_point'] += prize['amount'];
        userInfo['wing_point'] += prize['amount'];
        userInfo['level_up_shown'] = false;
      } else if (winCounter == 1) {
        gameData['flip_card']['win_prize_id'] = 'heart';
        userInfo['heart'] += 11;
      } else if (winCounter == 2) {
        gameData['flip_card']['win_prize_id'] = 'iphone';
      } else {
        gameData['flip_card']['win_prize_id'] = 'data';
      }

      winCounter += 1;
      return gameData['flip_card'];

    case 'flip-another':
      if (jsonBody['method'] == 'wingpoint') {
        userInfo['wing_point'] -= flipAnotherPointAmount;
      } else if (jsonBody['method'] == 'Heart') {
        userInfo['heart'] -= flipAnotherHeartAmount;
      }
      return gameData['flip_another'];

    case 'play-again':
      if (jsonBody['method'] == 'wingpoint') {
        userInfo['wing_point'] -= flipAnotherPointAmount;
      } else if (jsonBody['method'] == 'heart') {
        userInfo['heart'] -= flipAnotherHeartAmount;
      }
      return gameData['play_again'];

    case 'buy-heart':
      final itemId = jsonBody['item_id'];
      final items = gameData['shop']['items'] as List;
      final item = items.firstWhere((item) => item['id'] == itemId);

      userInfo['heart'] += item['amount'];
      userInfo['wing_point'] -= item['price'];

      return gameData['buy_heart'];

    case 'open-wingpoint':
    case 'view-my-prizes':
    case 'share':
    case 'exit':
    case 'invite':
    case 'toggle-sound':
    case 'exit-prize-popup':
    case 'play-now-click':
      return null;

    default:
      return {'error': null, 'message': 'The specified path does not exist.'};
  }
}
