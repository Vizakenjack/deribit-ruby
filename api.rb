require 'pry'
data = {
  "swagger": "2.0",
  "info": {
    "description": "",
    "title": "Deribit API",
    "version": "2.0.0"
  },
  "host": "localhost:8082",
  "basePath": "/api/v2",
  "schemes": [
    "http"
  ],
  "paths": {
    "/private/add_to_address_book": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Address book type",
            "enum": [
              "transfer",
              "withdrawal"
            ],
            "in": "query",
            "name": "type",
            "required": true,
            "type": "string"
          },
          {
            "description": "Address in currency format, it must be in address book",
            "in": "query",
            "name": "address",
            "required": true,
            "type": "string"
          },
          {
            "description": "Name of address book entry",
            "in": "query",
            "name": "name",
            "required": true,
            "type": "string"
          },
          {
            "description": "TFA code, required when TFA is enabled for current account",
            "in": "query",
            "name": "tfa",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_add_to_address_book_response"
            }
          }
        },
        "tags": [
          "wallet",
          "private",
          "internal"
        ],
        "summary": "Adds new entry to address book of given type"
      }
    },
    "/private/buy": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Instrument name",
            "in": "query",
            "name": "instrument_name",
            "required": true,
            "type": "string"
          },
          {
            "description": "It represents the requested order size. For perpetual and futures the amount is in USD units, for options it is amount of corresponding cryptocurrency contracts, e.g., BTC or ETH",
            "in": "query",
            "name": "amount",
            "required": true,
            "type": "number"
          },
          {
            "description": "The order type, default: `\"limit\"`",
            "enum": [
              "limit",
              "stop_limit",
              "market",
              "stop_market"
            ],
            "in": "query",
            "name": "type",
            "required": false,
            "type": "string"
          },
          {
            "description": "user defined label for the order (maximum 32 characters)",
            "in": "query",
            "name": "label",
            "required": false,
            "type": "string"
          },
          {
            "description": "<p>The order price in base currency (Only for limit and stop_limit orders)</p> <p>When adding order with advanced=usd, the field price should be the option price value in USD.</p> <p>When adding order with advanced=implv, the field price should be a value of implied volatility in percentages. For example,  price=100, means implied volatility of 100%</p>",
            "in": "query",
            "name": "price",
            "required": false,
            "type": "number"
          },
          {
            "default": "good_til_cancelled",
            "description": "<p>Specifies how long the order remains in effect. Default `\"good_til_cancelled\"`</p> <ul> <li>`\"good_til_cancelled\"` - unfilled order remains in order book until cancelled</li> <li>`\"fill_or_kill\"` - execute a transaction immediately and completely or not at all</li> <li>`\"immediate_or_cancel\"` - execute a transaction immediately, and any portion of the order that cannot be immediately filled is cancelled</li> </ul>",
            "enum": [
              "good_til_cancelled",
              "fill_or_kill",
              "immediate_or_cancel"
            ],
            "in": "query",
            "name": "time_in_force",
            "required": false,
            "type": "string"
          },
          {
            "default": 1,
            "description": "Maximum amount within an order to be shown to other customers, `0` for invisible order",
            "in": "query",
            "name": "max_show",
            "required": false,
            "type": "number"
          },
          {
            "default": true,
            "description": "<p>If true, the order is considered post-only. If the new price would cause the order to be filled immediately (as taker), the price will be changed to be just below the bid.</p> <p>Only valid in combination with time_in_force=`\"good_til_cancelled\"`</p>",
            "in": "query",
            "name": "post_only",
            "required": false,
            "type": "boolean"
          },
          {
            "default": false,
            "description": "If `true`, the order is considered reduce-only which is intended to only reduce a current position",
            "in": "query",
            "name": "reduce_only",
            "required": false,
            "type": "boolean"
          },
          {
            "description": "Stop price, required for stop limit orders (Only for stop orders)",
            "in": "query",
            "name": "stop_price",
            "required": false,
            "type": "number"
          },
          {
            "description": "Defines trigger type, required for `\"stop_limit\"` order type",
            "enum": [
              "index_price",
              "mark_price",
              "last_price"
            ],
            "in": "query",
            "name": "trigger",
            "required": false,
            "type": "string"
          },
          {
            "description": "Advanced option order type. (Only for options)",
            "enum": [
              "usd",
              "implv"
            ],
            "in": "query",
            "name": "advanced",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_buy_and_sell_response"
            }
          }
        },
        "tags": [
          "private",
          "trading"
        ],
        "summary": "Places a buy order for an instrument."
      },
      "x-order": 100
    },
    "/private/cancel": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The order id",
            "in": "query",
            "name": "order_id",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_cancel_response"
            }
          }
        },
        "tags": [
          "trading",
          "private"
        ],
        "summary": "Cancel an order, specified by order id"
      }
    },
    "/private/cancel_all": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/ok_response"
            }
          }
        },
        "tags": [
          "trading",
          "private"
        ],
        "summary": "This method cancels all users orders and stop orders within all currencies and instrument kinds."
      }
    },
    "/private/cancel_all_by_currency": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Instrument kind, if not provided instruments of all kinds are considered",
            "enum": [
              "future",
              "option"
            ],
            "in": "query",
            "name": "kind",
            "required": false,
            "type": "string"
          },
          {
            "description": "Order type - limit, stop or all, default - `all`",
            "enum": [
              "all",
              "limit",
              "stop"
            ],
            "in": "query",
            "name": "type",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/ok_response"
            }
          }
        },
        "tags": [
          "trading",
          "private"
        ],
        "summary": "Cancels all orders by currency, optionally filtered by instrument kind and/or order type."
      }
    },
    "/private/cancel_all_by_instrument": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Instrument name",
            "in": "query",
            "name": "instrument_name",
            "required": true,
            "type": "string"
          },
          {
            "description": "Order type - limit, stop or all, default - `all`",
            "enum": [
              "all",
              "limit",
              "stop"
            ],
            "in": "query",
            "name": "type",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/ok_response"
            }
          }
        },
        "tags": [
          "trading",
          "private"
        ],
        "summary": "Cancels all orders by instrument, optionally filtered by order type."
      }
    },
    "/private/cancel_transfer_by_id": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Id of transfer",
            "in": "query",
            "name": "id",
            "required": true,
            "type": "integer"
          },
          {
            "description": "TFA code, required when TFA is enabled for current account",
            "in": "query",
            "name": "tfa",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_submit_transfer_response"
            }
          }
        },
        "tags": [
          "private",
          "wallet"
        ],
        "summary": "Cancel transfer"
      }
    },
    "/private/cancel_withdrawal": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "The withdrawal id",
            "in": "query",
            "name": "id",
            "required": true,
            "type": "number"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_withdraw_response"
            }
          }
        },
        "tags": [
          "wallet",
          "private"
        ],
        "summary": "Cancels withdrawal request"
      }
    },
    "/private/change_subaccount_name": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The user id for the subaccount",
            "in": "query",
            "name": "sid",
            "required": true,
            "type": "integer"
          },
          {
            "description": "The new user name",
            "in": "query",
            "name": "name",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/ok_response"
            }
          }
        },
        "tags": [
          "private",
          "account_management"
        ],
        "summary": "Change the user name for a subaccount"
      }
    },
    "/private/close_position": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Instrument name",
            "in": "query",
            "name": "instrument_name",
            "required": true,
            "type": "string"
          },
          {
            "description": "The order type",
            "enum": [
              "limit",
              "market"
            ],
            "in": "query",
            "name": "type",
            "required": true,
            "type": "string"
          },
          {
            "description": "Optional price for limit order.",
            "in": "query",
            "name": "price",
            "required": false,
            "type": "number"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_buy_and_sell_response"
            }
          }
        },
        "tags": [
          "private",
          "trading"
        ],
        "summary": "Makes closing position reduce only order ."
      }
    },
    "/private/create_deposit_address": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_deposit_address_response"
            }
          }
        },
        "tags": [
          "wallet",
          "private"
        ],
        "summary": "Creates deposit address in currency"
      }
    },
    "/private/create_subaccount": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_create_subaccount_response"
            }
          }
        },
        "tags": [
          "private",
          "account_management"
        ],
        "summary": "Create a new subaccount"
      }
    },
    "/private/datatable": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/ok_response"
            }
          }
        },
        "tags": [
          "internal",
          "private",
          "v1",
          "websocket_only"
        ],
        "summary": "This is a private API endpoint intended for the user interface. This API is subject to change, and should not be used outside the Deribit interface."
      }
    },
    "/private/disable_cancel_on_disconnect": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/ok_response"
            }
          },
          "400": {
            "description": "result when used via rest/HTTP",
            "schema": {
              "$ref": "#/definitions/error_message"
            }
          }
        },
        "tags": [
          "websocket_only",
          "session_management",
          "private"
        ],
        "summary": "Disable Cancel On Disconnect for the connection. This does not change the default account setting."
      }
    },
    "/private/disable_tfa_for_subaccount": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The user id for the subaccount",
            "in": "query",
            "name": "sid",
            "required": true,
            "type": "integer"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/ok_response"
            }
          }
        },
        "tags": [
          "private",
          "account_management"
        ],
        "summary": "Disable two factor authentication for a subaccount."
      }
    },
    "/private/edit": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The order id",
            "in": "query",
            "name": "order_id",
            "required": true,
            "type": "string"
          },
          {
            "description": "It represents the requested order size. For perpetual and futures the amount is in USD units, for options it is amount of corresponding cryptocurrency contracts, e.g., BTC or ETH",
            "in": "query",
            "name": "amount",
            "required": true,
            "type": "number"
          },
          {
            "description": "<p>The order price in base currency.</p> <p>When editing an option order with advanced=usd, the field price should be the option price value in USD.</p> <p>When editing an option order with advanced=implv, the field price should be a value of implied volatility in percentages. For example,  price=100, means implied volatility of 100%</p>",
            "in": "query",
            "name": "price",
            "required": true,
            "type": "number"
          },
          {
            "default": true,
            "description": "<p>If true, the order is considered post-only. If the new price would cause the order to be filled immediately (as taker), the price will be changed to be just below the bid.</p> <p>Only valid in combination with time_in_force=`\"good_til_cancelled\"`</p>",
            "in": "query",
            "name": "post_only",
            "required": false,
            "type": "boolean"
          },
          {
            "description": "Advanced option order type. If you have posted an advanced option order, it is necessary to re-supply this parameter when editing it (Only for options)",
            "enum": [
              "usd",
              "implv"
            ],
            "in": "query",
            "name": "advanced",
            "required": false,
            "type": "string"
          },
          {
            "description": "Stop price, required for stop limit orders (Only for stop orders)",
            "in": "query",
            "name": "stop_price",
            "required": false,
            "type": "number"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_edit_response"
            }
          }
        },
        "tags": [
          "trading",
          "private"
        ],
        "summary": "Change price, amount and/or other properties of an order."
      },
      "x-order": 300
    },
    "/private/enable_cancel_on_disconnect": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/ok_response"
            }
          },
          "400": {
            "description": "result when used via rest/HTTP",
            "schema": {
              "$ref": "#/definitions/error_message"
            }
          }
        },
        "tags": [
          "websocket_only",
          "session_management",
          "private"
        ],
        "summary": "Enable Cancel On Disconnect for the connection. This does not change the default account setting."
      },
      "x-order": 100
    },
    "/private/get_account_summary": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Include additional fields",
            "in": "query",
            "name": "extended",
            "required": false,
            "type": "boolean"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_account_response"
            }
          }
        },
        "tags": [
          "account_management",
          "private"
        ],
        "summary": "Retrieves user account summary."
      }
    },
    "/private/get_address_book": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Address book type",
            "enum": [
              "transfer",
              "withdrawal"
            ],
            "in": "query",
            "name": "type",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_address_book_response"
            }
          }
        },
        "tags": [
          "wallet",
          "private",
          "internal"
        ],
        "summary": "Retrieves address book of given type"
      }
    },
    "/private/get_current_deposit_address": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_deposit_address_response"
            }
          }
        },
        "tags": [
          "wallet",
          "private"
        ],
        "summary": "Retrieve deposit address for currency"
      }
    },
    "/private/get_deposits": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Number of requested items, default - `10`",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "integer"
          },
          {
            "description": "The offset for pagination, default - `0`",
            "in": "query",
            "name": "offset",
            "required": false,
            "type": "integer"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_get_deposits_response"
            }
          }
        },
        "tags": [
          "wallet",
          "private"
        ],
        "summary": "Retrieve the latest users deposits"
      }
    },
    "/private/get_email_language": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_get_email_language_response"
            }
          }
        },
        "tags": [
          "account_management",
          "private"
        ],
        "summary": "Retrieves the language to be used for emails."
      }
    },
    "/private/get_margins": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Instrument name",
            "in": "query",
            "name": "instrument_name",
            "required": true,
            "type": "string"
          },
          {
            "description": "Amount, integer for future, float for option. For perpetual and futures the amount is in USD units, for options it is amount of corresponding cryptocurrency contracts, e.g., BTC or ETH.",
            "in": "query",
            "name": "amount",
            "required": true,
            "type": "number"
          },
          {
            "description": "Price",
            "in": "query",
            "name": "price",
            "required": true,
            "type": "number"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_get_margins_response"
            }
          }
        },
        "tags": [
          "trading",
          "private"
        ],
        "summary": "Get margins for given instrument, amount and price."
      }
    },
    "/private/get_new_announcements": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/get_announcements_response"
            }
          }
        },
        "tags": [
          "account_management",
          "private"
        ],
        "summary": "Retrieves announcements that have not been marked read by the user."
      }
    },
    "/private/get_open_orders_by_currency": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Instrument kind, if not provided instruments of all kinds are considered",
            "enum": [
              "future",
              "option"
            ],
            "in": "query",
            "name": "kind",
            "required": false,
            "type": "string"
          },
          {
            "description": "Order type, default - `all`",
            "enum": [
              "all",
              "limit",
              "stop_all",
              "stop_limit",
              "stop_market"
            ],
            "in": "query",
            "name": "type",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_get_open_orders_response"
            }
          }
        },
        "tags": [
          "trading",
          "private"
        ],
        "summary": "Retrieves list of user's open orders."
      }
    },
    "/private/get_open_orders_by_instrument": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Instrument name",
            "in": "query",
            "name": "instrument_name",
            "required": true,
            "type": "string"
          },
          {
            "description": "Order type, default - `all`",
            "enum": [
              "all",
              "limit",
              "stop_all",
              "stop_limit",
              "stop_market"
            ],
            "in": "query",
            "name": "type",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_get_open_orders_response"
            }
          }
        },
        "tags": [
          "trading",
          "private"
        ],
        "summary": "Retrieves list of user's open orders within given Instrument."
      }
    },
    "/private/get_order_history_by_currency": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Instrument kind, if not provided instruments of all kinds are considered",
            "enum": [
              "future",
              "option"
            ],
            "in": "query",
            "name": "kind",
            "required": false,
            "type": "string"
          },
          {
            "description": "Number of requested items, default - `20`",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "integer"
          },
          {
            "description": "The offset for pagination, default - `0`",
            "in": "query",
            "name": "offset",
            "required": false,
            "type": "integer"
          },
          {
            "description": "Include in result orders older than 2 days, default - `false`",
            "in": "query",
            "name": "include_old",
            "required": false,
            "type": "boolean"
          },
          {
            "description": "Include in result fully unfilled closed orders, default - `false`",
            "in": "query",
            "name": "include_unfilled",
            "required": false,
            "type": "boolean"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_get_order_history_response"
            }
          }
        },
        "tags": [
          "trading",
          "private"
        ],
        "summary": "Retrieves history of orders that have been partially or fully filled."
      }
    },
    "/private/get_order_history_by_instrument": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Instrument name",
            "in": "query",
            "name": "instrument_name",
            "required": true,
            "type": "string"
          },
          {
            "description": "Number of requested items, default - `20`",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "integer"
          },
          {
            "description": "The offset for pagination, default - `0`",
            "in": "query",
            "name": "offset",
            "required": false,
            "type": "integer"
          },
          {
            "description": "Include in result orders older than 2 days, default - `false`",
            "in": "query",
            "name": "include_old",
            "required": false,
            "type": "boolean"
          },
          {
            "description": "Include in result fully unfilled closed orders, default - `false`",
            "in": "query",
            "name": "include_unfilled",
            "required": false,
            "type": "boolean"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_get_order_history_response"
            }
          }
        },
        "tags": [
          "trading",
          "private"
        ],
        "summary": "Retrieves history of orders that have been partially or fully filled."
      }
    },
    "/private/get_order_margin_by_ids": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "collectionFormat": "multi",
            "description": "Ids of orders",
            "in": "query",
            "items": {
              "type": "string"
            },
            "name": "ids",
            "required": true,
            "type": "array"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_get_order_margin_by_ids_response"
            }
          }
        },
        "tags": [
          "trading",
          "private"
        ],
        "summary": "Retrieves initial margins of given orders"
      }
    },
    "/private/get_order_state": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The order id",
            "in": "query",
            "name": "order_id",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_get_order_state_response"
            }
          },
          "400": {
            "description": "result when used via rest/HTTP",
            "schema": {
              "$ref": "#/definitions/error_message"
            }
          }
        },
        "tags": [
          "private",
          "trading"
        ],
        "summary": "Retrieve the current state of an order."
      }
    },
    "/private/get_position": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Instrument name",
            "in": "query",
            "name": "instrument_name",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_get_position_response"
            }
          },
          "400": {
            "description": "When some error occurs",
            "schema": {
              "$ref": "#/definitions/error_message"
            }
          }
        },
        "tags": [
          "private",
          "account_management"
        ],
        "summary": "Retrieve user position."
      }
    },
    "/private/get_positions": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Kind filter on positions",
            "enum": [
              "future",
              "option"
            ],
            "in": "query",
            "name": "kind",
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_get_positions_response"
            }
          },
          "400": {
            "description": "When some error occurs",
            "schema": {
              "$ref": "#/definitions/error_message"
            }
          }
        },
        "tags": [
          "private",
          "account_management"
        ],
        "summary": "Retrieve user positions."
      }
    },
    "/private/get_settlement_history_by_currency": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Settlement type",
            "enum": [
              "settlement",
              "delivery",
              "bankruptcy"
            ],
            "in": "query",
            "name": "type",
            "required": false,
            "type": "string"
          },
          {
            "description": "Number of requested items, default - `20`",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "integer"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_settlement_response"
            }
          }
        },
        "tags": [
          "trading",
          "private"
        ],
        "summary": "Retrieves settlement, delivery and bankruptcy events that have affected your account."
      },
      "x-order": 10200
    },
    "/private/get_settlement_history_by_instrument": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Instrument name",
            "in": "query",
            "name": "instrument_name",
            "required": true,
            "type": "string"
          },
          {
            "description": "Settlement type",
            "enum": [
              "settlement",
              "delivery",
              "bankruptcy"
            ],
            "in": "query",
            "name": "type",
            "required": false,
            "type": "string"
          },
          {
            "description": "Number of requested items, default - `20`",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "integer"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_settlement_response"
            }
          }
        },
        "tags": [
          "trading",
          "private"
        ],
        "summary": "Retrieves public settlement, delivery and bankruptcy events filtered by instrument name"
      },
      "x-order": 10100
    },
    "/private/get_subaccounts": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "in": "query",
            "name": "with_portfolio",
            "type": "boolean"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_get_subaccounts_response"
            }
          },
          "401": {
            "description": "not authorised",
            "schema": {
              "$ref": "#/definitions/error_message"
            }
          }
        },
        "tags": [
          "private",
          "account_management"
        ],
        "summary": "Get information about subaccounts"
      }
    },
    "/private/get_transfers": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Number of requested items, default - `10`",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "integer"
          },
          {
            "description": "The offset for pagination, default - `0`",
            "in": "query",
            "name": "offset",
            "required": false,
            "type": "integer"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_get_transfers_response"
            }
          }
        },
        "tags": [
          "wallet",
          "private"
        ],
        "summary": "Adds new entry to address book of given type"
      }
    },
    "/private/get_user_trades_by_currency": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Instrument kind, if not provided instruments of all kinds are considered",
            "enum": [
              "future",
              "option"
            ],
            "in": "query",
            "name": "kind",
            "required": false,
            "type": "string"
          },
          {
            "description": "The ID number of the first trade to be returned",
            "in": "query",
            "name": "start_id",
            "required": false,
            "type": "string"
          },
          {
            "description": "The ID number of the last trade to be returned",
            "in": "query",
            "name": "end_id",
            "required": false,
            "type": "string"
          },
          {
            "description": "Number of requested items, default - `10`",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "integer"
          },
          {
            "description": "Include trades older than 7 days, default - `false`",
            "in": "query",
            "name": "include_old",
            "required": false,
            "type": "boolean"
          },
          {
            "description": "Direction of results sorting (`default` value means no sorting, results will be returned in order in which they left the database)",
            "enum": [
              "asc",
              "desc",
              "default"
            ],
            "in": "query",
            "name": "sorting",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/user_trades_history_response"
            }
          }
        },
        "tags": [
          "trading",
          "private"
        ],
        "summary": "Retrieve the latest user trades that have occurred for instruments in a specific currency symbol."
      }
    },
    "/private/get_user_trades_by_currency_and_time": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Instrument kind, if not provided instruments of all kinds are considered",
            "enum": [
              "future",
              "option"
            ],
            "in": "query",
            "name": "kind",
            "required": false,
            "type": "string"
          },
          {
            "description": "The earliest timestamp to return result for",
            "in": "query",
            "name": "start_timestamp",
            "required": true,
            "type": "integer"
          },
          {
            "description": "The most recent timestamp to return result for",
            "in": "query",
            "name": "end_timestamp",
            "required": true,
            "type": "integer"
          },
          {
            "description": "Number of requested items, default - `10`",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "integer"
          },
          {
            "description": "Include trades older than 7 days, default - `false`",
            "in": "query",
            "name": "include_old",
            "required": false,
            "type": "boolean"
          },
          {
            "description": "Direction of results sorting (`default` value means no sorting, results will be returned in order in which they left the database)",
            "enum": [
              "asc",
              "desc",
              "default"
            ],
            "in": "query",
            "name": "sorting",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/user_trades_history_response"
            }
          }
        },
        "tags": [
          "trading",
          "private"
        ],
        "summary": "Retrieve the latest user trades that have occurred for instruments in a specific currency symbol and within given time range."
      }
    },
    "/private/get_user_trades_by_instrument": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Instrument name",
            "in": "query",
            "name": "instrument_name",
            "required": true,
            "type": "string"
          },
          {
            "description": "The sequence number of the first trade to be returned",
            "in": "query",
            "name": "start_seq",
            "required": false,
            "type": "integer"
          },
          {
            "description": "The sequence number of the last trade to be returned",
            "in": "query",
            "name": "end_seq",
            "required": false,
            "type": "integer"
          },
          {
            "description": "Number of requested items, default - `10`",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "integer"
          },
          {
            "description": "Include trades older than 7 days, default - `false`",
            "in": "query",
            "name": "include_old",
            "required": false,
            "type": "boolean"
          },
          {
            "description": "Direction of results sorting (`default` value means no sorting, results will be returned in order in which they left the database)",
            "enum": [
              "asc",
              "desc",
              "default"
            ],
            "in": "query",
            "name": "sorting",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/user_trades_history_response"
            }
          }
        },
        "tags": [
          "trading",
          "private"
        ],
        "summary": "Retrieve the latest user trades that have occurred for a specific instrument."
      }
    },
    "/private/get_user_trades_by_instrument_and_time": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Instrument name",
            "in": "query",
            "name": "instrument_name",
            "required": true,
            "type": "string"
          },
          {
            "description": "The earliest timestamp to return result for",
            "in": "query",
            "name": "start_timestamp",
            "required": true,
            "type": "integer"
          },
          {
            "description": "The most recent timestamp to return result for",
            "in": "query",
            "name": "end_timestamp",
            "required": true,
            "type": "integer"
          },
          {
            "description": "Number of requested items, default - `10`",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "integer"
          },
          {
            "description": "Include trades older than 7 days, default - `false`",
            "in": "query",
            "name": "include_old",
            "required": false,
            "type": "boolean"
          },
          {
            "description": "Direction of results sorting (`default` value means no sorting, results will be returned in order in which they left the database)",
            "enum": [
              "asc",
              "desc",
              "default"
            ],
            "in": "query",
            "name": "sorting",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/user_trades_history_response"
            }
          }
        },
        "tags": [
          "trading",
          "private"
        ],
        "summary": "Retrieve the latest user trades that have occurred for a specific instrument and within given time range."
      }
    },
    "/private/get_user_trades_by_order": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The order id",
            "in": "query",
            "name": "order_id",
            "required": true,
            "type": "string"
          },
          {
            "description": "Direction of results sorting (`default` value means no sorting, results will be returned in order in which they left the database)",
            "enum": [
              "asc",
              "desc",
              "default"
            ],
            "in": "query",
            "name": "sorting",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/user_trades_by_order_response"
            }
          }
        },
        "tags": [
          "trading",
          "private"
        ],
        "summary": "Retrieve the list of user trades that was created for given order"
      }
    },
    "/private/get_withdrawals": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Number of requested items, default - `10`",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "integer"
          },
          {
            "description": "The offset for pagination, default - `0`",
            "in": "query",
            "name": "offset",
            "required": false,
            "type": "integer"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_get_withdrawals_response"
            }
          }
        },
        "tags": [
          "wallet",
          "private"
        ],
        "summary": "Retrieve the latest users withdrawals"
      }
    },
    "/private/getopenorders": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Instrument to return open orders for",
            "in": "query",
            "name": "instrument",
            "required": false,
            "type": "string"
          },
          {
            "description": "order ID",
            "in": "query",
            "name": "orderId",
            "required": false,
            "type": "number"
          },
          {
            "description": "Order types to return. Valid values include `\"limit\"`, `\"stop_limit\"`",
            "in": "query",
            "name": "type",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_getopenorders_response"
            }
          }
        },
        "tags": [
          "trading",
          "private",
          "v1"
        ],
        "summary": "Retrieves open orders.\nThis API endpoint requires your request to be signed."
      }
    },
    "/private/logout": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [],
        "responses": {
          "200": {
            "description": "foo"
          },
          "400": {
            "description": "result when used via rest/HTTP",
            "schema": {
              "$ref": "#/definitions/error_message"
            }
          }
        },
        "tags": [
          "websocket_only",
          "authentication",
          "private"
        ],
        "summary": "Gracefully close websocket connection, when COD (Cancel On Disconnect) is enabled orders are not cancelled"
      }
    },
    "/private/orderhistory": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "the number of items to be returned.",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "number"
          },
          {
            "description": "Either the name of an instrument, \"future\" of \"option\"",
            "in": "query",
            "name": "instrument",
            "required": false,
            "type": "string"
          },
          {
            "description": "The offset for pagination",
            "in": "query",
            "name": "offset",
            "required": false,
            "type": "number"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_orderhistory_response"
            }
          }
        },
        "tags": [
          "trading",
          "private",
          "v1"
        ],
        "summary": "Retrieves history of orders that have been partially or fully filled. \nThis API endpoint requires your request to be signed."
      }
    },
    "/private/orderstate": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Required, the ID of the order to be retrieved",
            "in": "query",
            "name": "orderId",
            "required": false,
            "type": "number"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_orderstate_response"
            }
          }
        },
        "tags": [
          "trading",
          "private",
          "v1"
        ],
        "summary": "Retrieve order details state by order id. \nThis API endpoint requires your request to be signed."
      }
    },
    "/private/positions": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Base currency to return positions for (`BTC`, `ETH` or all)",
            "in": "query",
            "name": "currency",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_positions_response"
            }
          }
        },
        "tags": [
          "trading",
          "private",
          "v1"
        ],
        "summary": "Retrieves current positions.\nThis API endpoint requires your request to be signed."
      }
    },
    "/private/remove_from_address_book": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Address book type",
            "enum": [
              "transfer",
              "withdrawal"
            ],
            "in": "query",
            "name": "type",
            "required": true,
            "type": "string"
          },
          {
            "description": "Address in currency format, it must be in address book",
            "in": "query",
            "name": "address",
            "required": true,
            "type": "string"
          },
          {
            "description": "TFA code, required when TFA is enabled for current account",
            "in": "query",
            "name": "tfa",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_remove_from_address_book_response"
            }
          }
        },
        "tags": [
          "wallet",
          "private",
          "internal"
        ],
        "summary": "Adds new entry to address book of given type"
      }
    },
    "/private/sell": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Instrument name",
            "in": "query",
            "name": "instrument_name",
            "required": true,
            "type": "string"
          },
          {
            "description": "It represents the requested order size. For perpetual and futures the amount is in USD units, for options it is amount of corresponding cryptocurrency contracts, e.g., BTC or ETH",
            "in": "query",
            "name": "amount",
            "required": true,
            "type": "number"
          },
          {
            "description": "The order type, default: `\"limit\"`",
            "enum": [
              "limit",
              "stop_limit",
              "market",
              "stop_market"
            ],
            "in": "query",
            "name": "type",
            "required": false,
            "type": "string"
          },
          {
            "description": "user defined label for the order (maximum 32 characters)",
            "in": "query",
            "name": "label",
            "required": false,
            "type": "string"
          },
          {
            "description": "<p>The order price in base currency (Only for limit and stop_limit orders)</p> <p>When adding order with advanced=usd, the field price should be the option price value in USD.</p> <p>When adding order with advanced=implv, the field price should be a value of implied volatility in percentages. For example,  price=100, means implied volatility of 100%</p>",
            "in": "query",
            "name": "price",
            "required": false,
            "type": "number"
          },
          {
            "default": "good_til_cancelled",
            "description": "<p>Specifies how long the order remains in effect. Default `\"good_til_cancelled\"`</p> <ul> <li>`\"good_til_cancelled\"` - unfilled order remains in order book until cancelled</li> <li>`\"fill_or_kill\"` - execute a transaction immediately and completely or not at all</li> <li>`\"immediate_or_cancel\"` - execute a transaction immediately, and any portion of the order that cannot be immediately filled is cancelled</li> </ul>",
            "enum": [
              "good_til_cancelled",
              "fill_or_kill",
              "immediate_or_cancel"
            ],
            "in": "query",
            "name": "time_in_force",
            "required": false,
            "type": "string"
          },
          {
            "default": 1,
            "description": "Maximum amount within an order to be shown to other customers, `0` for invisible order",
            "in": "query",
            "name": "max_show",
            "required": false,
            "type": "number"
          },
          {
            "default": true,
            "description": "<p>If true, the order is considered post-only. If the new price would cause the order to be filled immediately (as taker), the price will be changed to be just below the bid.</p> <p>Only valid in combination with time_in_force=`\"good_til_cancelled\"`</p>",
            "in": "query",
            "name": "post_only",
            "required": false,
            "type": "boolean"
          },
          {
            "default": false,
            "description": "If `true`, the order is considered reduce-only which is intended to only reduce a current position",
            "in": "query",
            "name": "reduce_only",
            "required": false,
            "type": "boolean"
          },
          {
            "description": "Stop price, required for stop limit orders (Only for stop orders)",
            "in": "query",
            "name": "stop_price",
            "required": false,
            "type": "number"
          },
          {
            "description": "Defines trigger type, required for `\"stop_limit\"` order type",
            "enum": [
              "index_price",
              "mark_price",
              "last_price"
            ],
            "in": "query",
            "name": "trigger",
            "required": false,
            "type": "string"
          },
          {
            "description": "Advanced option order type. (Only for options)",
            "enum": [
              "usd",
              "implv"
            ],
            "in": "query",
            "name": "advanced",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_buy_and_sell_response"
            }
          }
        },
        "tags": [
          "private",
          "trading"
        ],
        "summary": "Places a sell order for an instrument."
      },
      "x-order": 200
    },
    "/private/set_announcement_as_read": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "the ID of the announcement",
            "in": "query",
            "name": "announcement_id",
            "required": true,
            "type": "number"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/ok_response"
            }
          }
        },
        "tags": [
          "account_management",
          "private"
        ],
        "summary": "Marks an announcement as read, so it will not be shown in `get_new_announcements`."
      }
    },
    "/private/set_email_for_subaccount": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The user id for the subaccount",
            "in": "query",
            "name": "sid",
            "required": true,
            "type": "integer"
          },
          {
            "description": "The email address for the subaccount",
            "in": "query",
            "name": "email",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/ok_response"
            }
          }
        },
        "tags": [
          "private",
          "account_management"
        ],
        "summary": "Assign an email address to a subaccount. User will receive an email with confirmation link."
      }
    },
    "/private/set_email_language": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The abbreviated language name. Valid values include `\"en\"`, `\"ko\"`, `\"zh\"`",
            "in": "query",
            "name": "language",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/ok_response"
            }
          }
        },
        "tags": [
          "account_management",
          "private"
        ],
        "summary": "Changes the language to be used for emails."
      }
    },
    "/private/set_password_for_subaccount": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The user id for the subaccount",
            "in": "query",
            "name": "sid",
            "required": true,
            "type": "integer"
          },
          {
            "description": "The password for the subaccount",
            "in": "query",
            "name": "password",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/ok_response"
            }
          }
        },
        "tags": [
          "private",
          "account_management"
        ],
        "summary": "Set the password for the subaccount"
      }
    },
    "/private/submit_transfer_to_subaccount": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Amount of funds to be transferred",
            "in": "query",
            "name": "amount",
            "required": true,
            "type": "number"
          },
          {
            "description": "Id of destination subaccount",
            "in": "query",
            "name": "destination",
            "required": true,
            "type": "integer"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_submit_transfer_response"
            }
          }
        },
        "tags": [
          "private",
          "wallet",
          "internal"
        ],
        "summary": "Transfer funds to a subaccount."
      }
    },
    "/private/submit_transfer_to_user": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Amount of funds to be transferred",
            "in": "query",
            "name": "amount",
            "required": true,
            "type": "number"
          },
          {
            "description": "Destination address from address book",
            "in": "query",
            "name": "destination",
            "required": true,
            "type": "string"
          },
          {
            "description": "TFA code, required when TFA is enabled for current account",
            "in": "query",
            "name": "tfa",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_submit_transfer_response"
            }
          }
        },
        "tags": [
          "private",
          "wallet",
          "internal"
        ],
        "summary": "Transfer funds to a another user."
      }
    },
    "/private/subscribe": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "collectionFormat": "multi",
            "description": "A list of channels to subscribe to.",
            "in": "query",
            "items": {
              "type": "string",
              "x-deribit-type": "channel"
            },
            "name": "channels",
            "required": true,
            "type": "array"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_subscribe_response"
            }
          },
          "401": {
            "description": "not authorised",
            "schema": {
              "$ref": "#/definitions/error_message"
            }
          }
        },
        "tags": [
          "private",
          "websocket_only",
          "subscription_management"
        ],
        "description": "Subscribe to one or more channels.\n\nThe name of the channel determines what information will be provided, and\nin what form.\n",
        "summary": "Subscribe to one or more channels."
      }
    },
    "/private/toggle_deposit_address_creation": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "in": "query",
            "name": "state",
            "required": true,
            "type": "boolean"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/ok_response"
            }
          }
        },
        "tags": [
          "wallet",
          "private",
          "internal"
        ],
        "summary": "Enable or disable deposit address creation"
      }
    },
    "/private/toggle_notifications_from_subaccount": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The user id for the subaccount",
            "in": "query",
            "name": "sid",
            "required": true,
            "type": "integer"
          },
          {
            "description": "enable (`true`) or disable (`false`) notifications",
            "in": "query",
            "name": "state",
            "required": true,
            "type": "boolean"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/ok_response"
            }
          }
        },
        "tags": [
          "private",
          "account_management"
        ],
        "summary": "Enable or disable sending of notifications for the subaccount."
      }
    },
    "/private/toggle_subaccount_login": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The user id for the subaccount",
            "in": "query",
            "name": "sid",
            "required": true,
            "type": "integer"
          },
          {
            "description": "enable or disable login.",
            "enum": [
              "enable",
              "disable"
            ],
            "in": "query",
            "name": "state",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/ok_response"
            }
          }
        },
        "tags": [
          "private",
          "account_management"
        ],
        "summary": "Enable or disable login for a subaccount. If login is disabled and a session for the subaccount exists, this session will be terminated."
      }
    },
    "/private/tradehistory": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "`\"asc\"` for ascending, `\"desc\"` for descending",
            "in": "query",
            "name": "sort",
            "required": false,
            "type": "string"
          },
          {
            "description": "Either the name of the instrument, or `\"all\"` for instruments, `\"futures\"` for all futures, or `\"options\"` for all options.",
            "in": "query",
            "name": "instrument",
            "required": true,
            "type": "string"
          },
          {
            "description": "The number of trades returned (clamped to max 10000)",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "number"
          },
          {
            "description": "The ID of the first trade to be returned",
            "in": "query",
            "name": "startId",
            "required": false,
            "type": "number"
          },
          {
            "description": "The ID of the last trade to be returned",
            "in": "query",
            "name": "endId",
            "required": false,
            "type": "number"
          },
          {
            "description": "The trade sequence of the first trade to be returned",
            "in": "query",
            "name": "startSeq",
            "required": false,
            "type": "number"
          },
          {
            "description": "The trade sequence of the last trade to be returned",
            "in": "query",
            "name": "endSeq",
            "required": false,
            "type": "number"
          },
          {
            "description": "The timestamp (in ms) of the first trade to be returned",
            "in": "query",
            "name": "startTimestamp",
            "required": false,
            "type": "integer"
          },
          {
            "description": "The timestamp (in ms) of the last trade to be returned",
            "in": "query",
            "name": "endTimestamp",
            "required": false,
            "type": "integer"
          },
          {
            "description": "DEPRECATED, The ID after which trades are returned, for backward compatibility",
            "in": "query",
            "name": "since",
            "required": false,
            "type": "number"
          },
          {
            "description": "DEPRECATED, alias to \"sort\", for backward compatibility",
            "in": "query",
            "name": "direction",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_tradehistory_response"
            }
          }
        },
        "tags": [
          "trading",
          "private",
          "v1"
        ],
        "summary": "Retrieve the trade history of the account. This API endpoint requires your request to be signed."
      }
    },
    "/private/unsubscribe": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "collectionFormat": "multi",
            "description": "A list of channels to unsubscribe from.",
            "in": "query",
            "items": {
              "type": "string"
            },
            "name": "channels",
            "required": true,
            "type": "array"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_subscribe_response"
            }
          },
          "401": {
            "description": "not authorised",
            "schema": {
              "$ref": "#/definitions/error_message"
            }
          }
        },
        "tags": [
          "private",
          "websocket_only",
          "subscription_management"
        ],
        "summary": "Unsubscribe from one or more channels."
      }
    },
    "/private/withdraw": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Address in currency format, it must be in address book",
            "in": "query",
            "name": "address",
            "required": true,
            "type": "string"
          },
          {
            "description": "Amount of funds to be withdrawn",
            "in": "query",
            "name": "amount",
            "required": true,
            "type": "number"
          },
          {
            "description": "Withdrawal priority, optional for BTC, default: `high`",
            "enum": [
              "insane",
              "extreme_high",
              "very_high",
              "high",
              "mid",
              "low",
              "very_low"
            ],
            "in": "query",
            "name": "priority",
            "required": false,
            "type": "string"
          },
          {
            "description": "TFA code, required when TFA is enabled for current account",
            "in": "query",
            "name": "tfa",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_withdraw_response"
            }
          }
        },
        "tags": [
          "wallet",
          "private"
        ],
        "summary": "Creates a new withdrawal request"
      }
    },
    "/public/auth": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Method of authentication",
            "enum": [
              "password",
              "client_credentials",
              "client_signature",
              "refresh_token"
            ],
            "in": "query",
            "name": "grant_type",
            "required": true,
            "type": "string"
          },
          {
            "description": "Required for grant type `password`",
            "in": "query",
            "name": "username",
            "required": true,
            "type": "string"
          },
          {
            "description": "Required for grant type `password`",
            "in": "query",
            "name": "password",
            "required": true,
            "type": "string"
          },
          {
            "description": "Required for grant type `client_credentials` and `client_signature`",
            "in": "query",
            "name": "client_id",
            "required": true,
            "type": "string"
          },
          {
            "description": "Required for grant type `client_credentials`",
            "in": "query",
            "name": "client_secret",
            "required": true,
            "type": "string"
          },
          {
            "description": "Required for grant type `refresh_token`",
            "in": "query",
            "name": "refresh_token",
            "required": true,
            "type": "string"
          },
          {
            "description": "Required for grant type `client_signature`, provides time when request has been generated",
            "in": "query",
            "name": "timestamp",
            "required": true,
            "type": "string"
          },
          {
            "description": "Required for grant type `client_signature`; it's a cryptographic signature calculated over provided fields using user **secret key**. The signature should be calculated as an HMAC (Hash-based Message Authentication Code) with `SHA256` hash algorithm",
            "in": "query",
            "name": "signature",
            "required": true,
            "type": "string"
          },
          {
            "description": "Optional for grant type `client_signature`; delivers user generated initialization vector for the server token",
            "in": "query",
            "name": "nonce",
            "type": "string"
          },
          {
            "description": "Will be passed back in the response",
            "in": "query",
            "name": "state",
            "type": "string"
          },
          {
            "description": "Describes type of the access for assigned token, possible values: `connection`, `session`, `session:name`, `trade:[read, read_write, none]`, `wallet:[read, read_write, none]`, `account:[read, read_write, none]`",
            "in": "query",
            "name": "scope",
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_auth_response"
            }
          },
          "429": {
            "description": "over limit",
            "schema": {
              "$ref": "#/definitions/error_message"
            }
          }
        },
        "tags": [
          "public",
          "authentication"
        ],
        "description": "Retrieve an Oauth access token, to be used for authentication of 'private' requests.\n\nThree methods of authentication are supported:\n\n- <code>password</code> - using email and and password as when logging on to the website\n- <code>client_credentials</code> - using the access key and access secret that can be found on the API page on the website\n- <code>client_signature</code> - using the access key that can be found on the API page on the website and user generated signature. The signature is calculated using some fields provided in the request, using formula described here [Deribit signature credentials](#additional-authorization-method-deribit-signature-credentials)\n- <code>refresh_token</code> - using a refresh token that was received from an earlier invocation\n\nThe response will contain an access token, expiration period (number of seconds that the token is valid) and a refresh token that can \nbe used to get a new set of tokens.\n",
        "summary": "Authenticate"
      }
    },
    "/public/disable_heartbeat": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/ok_response"
            }
          },
          "400": {
            "description": "result when used via rest/HTTP",
            "schema": {
              "$ref": "#/definitions/error_message"
            }
          }
        },
        "tags": [
          "websocket_only",
          "session_management",
          "public"
        ],
        "summary": "Stop sending heartbeat messages."
      }
    },
    "/public/get_announcements": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/get_announcements_response"
            }
          }
        },
        "tags": [
          "account_management",
          "public"
        ],
        "summary": "Retrieves announcements from the last 30 days."
      }
    },
    "/public/get_book_summary_by_currency": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Instrument kind, if not provided instruments of all kinds are considered",
            "enum": [
              "future",
              "option"
            ],
            "in": "query",
            "name": "kind",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_get_book_summary_response"
            }
          }
        },
        "tags": [
          "market_data",
          "public"
        ],
        "summary": "Retrieves the summary information such as open interest, 24h volume, etc. for all instruments for the currency (optionally filtered by kind)."
      }
    },
    "/public/get_book_summary_by_instrument": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Instrument name",
            "in": "query",
            "name": "instrument_name",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_get_book_summary_response"
            }
          }
        },
        "tags": [
          "market_data",
          "public"
        ],
        "summary": "Retrieves the summary information such as open interest, 24h volume, etc. for a specific instrument."
      }
    },
    "/public/get_contract_size": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Instrument name",
            "in": "query",
            "name": "instrument_name",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_get_contract_size_response"
            }
          }
        },
        "tags": [
          "public",
          "market_data"
        ],
        "summary": "Retrieves contract size of provided instrument."
      }
    },
    "/public/get_currencies": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_currencies_response"
            }
          }
        },
        "tags": [
          "public",
          "market_data"
        ],
        "summary": "Retrieves all cryptocurrencies supported by the API."
      }
    },
    "/public/get_footer": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_get_footer_response"
            }
          }
        },
        "tags": [
          "internal"
        ],
        "summary": "Get information to be displayed in the footer of the website."
      }
    },
    "/public/get_funding_chart_data": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Instrument name",
            "in": "query",
            "name": "instrument_name",
            "required": true,
            "type": "string"
          },
          {
            "description": "Specifies time period. `8h` - 8 hours, `24h` - 24 hours",
            "enum": [
              "8h",
              "24h"
            ],
            "in": "query",
            "name": "length",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_get_funding_chart_data_response"
            }
          }
        },
        "tags": [
          "public",
          "market_data"
        ],
        "summary": "Retrieve the latest user trades that have occurred for PERPETUAL instruments in a specific currency symbol and within given time range."
      }
    },
    "/public/get_historical_volatility": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_historical_volatility_response"
            }
          }
        },
        "tags": [
          "public",
          "market_data"
        ],
        "summary": "Provides information about historical volatility for given cryptocurrency."
      }
    },
    "/public/get_index": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_index_response"
            }
          }
        },
        "tags": [
          "market_data",
          "public"
        ],
        "summary": "Retrieves the current index price for the instruments, for the selected currency."
      }
    },
    "/public/get_instruments": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Instrument kind, if not provided instruments of all kinds are considered",
            "enum": [
              "future",
              "option"
            ],
            "in": "query",
            "name": "kind",
            "required": false,
            "type": "string"
          },
          {
            "default": false,
            "description": "Set to true to show expired instruments instead of active ones.",
            "in": "query",
            "name": "expired",
            "type": "boolean"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_get_instruments_response"
            }
          }
        },
        "tags": [
          "public",
          "market_data"
        ],
        "summary": "Retrieves available trading instruments. This method can be used to see which instruments are available for trading, or which instruments have existed historically."
      }
    },
    "/public/get_last_settlements_by_currency": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Settlement type",
            "enum": [
              "settlement",
              "delivery",
              "bankruptcy"
            ],
            "in": "query",
            "name": "type",
            "required": false,
            "type": "string"
          },
          {
            "description": "Number of requested items, default - `20`",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "integer"
          },
          {
            "description": "Continuation token for pagination",
            "in": "query",
            "name": "continuation",
            "required": false,
            "type": "string"
          },
          {
            "description": "The latest timestamp to return result for",
            "in": "query",
            "name": "search_start_timestamp",
            "required": false,
            "type": "integer"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/settlement_response"
            }
          }
        },
        "tags": [
          "market_data",
          "public"
        ],
        "summary": "Retrieves historical settlement, delivery and bankruptcy events coming from all instruments within given currency."
      }
    },
    "/public/get_last_settlements_by_instrument": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Instrument name",
            "in": "query",
            "name": "instrument_name",
            "required": true,
            "type": "string"
          },
          {
            "description": "Settlement type",
            "enum": [
              "settlement",
              "delivery",
              "bankruptcy"
            ],
            "in": "query",
            "name": "type",
            "required": false,
            "type": "string"
          },
          {
            "description": "Number of requested items, default - `20`",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "integer"
          },
          {
            "description": "Continuation token for pagination",
            "in": "query",
            "name": "continuation",
            "required": false,
            "type": "string"
          },
          {
            "description": "The latest timestamp to return result for",
            "in": "query",
            "name": "search_start_timestamp",
            "required": false,
            "type": "integer"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/settlement_response"
            }
          }
        },
        "tags": [
          "market_data",
          "public"
        ],
        "summary": "Retrieves historical public settlement, delivery and bankruptcy events filtered by instrument name."
      }
    },
    "/public/get_last_trades_by_currency": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Instrument kind, if not provided instruments of all kinds are considered",
            "enum": [
              "future",
              "option"
            ],
            "in": "query",
            "name": "kind",
            "required": false,
            "type": "string"
          },
          {
            "description": "The sequence number of the first trade to be returned",
            "in": "query",
            "name": "start_seq",
            "required": false,
            "type": "integer"
          },
          {
            "description": "The sequence number of the last trade to be returned",
            "in": "query",
            "name": "end_seq",
            "required": false,
            "type": "integer"
          },
          {
            "description": "Number of requested items, default - `10`",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "integer"
          },
          {
            "description": "Include trades older than 7 days, default - `false`",
            "in": "query",
            "name": "include_old",
            "required": false,
            "type": "boolean"
          },
          {
            "description": "Direction of results sorting (`default` value means no sorting, results will be returned in order in which they left the database)",
            "enum": [
              "asc",
              "desc",
              "default"
            ],
            "in": "query",
            "name": "sorting",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_trades_history_response"
            }
          }
        },
        "tags": [
          "market_data",
          "public"
        ],
        "summary": "Retrieve the latest trades that have occurred for instruments in a specific currency symbol."
      }
    },
    "/public/get_last_trades_by_currency_and_time": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          },
          {
            "description": "Instrument kind, if not provided instruments of all kinds are considered",
            "enum": [
              "future",
              "option"
            ],
            "in": "query",
            "name": "kind",
            "required": false,
            "type": "string"
          },
          {
            "description": "The earliest timestamp to return result for",
            "in": "query",
            "name": "start_timestamp",
            "required": true,
            "type": "integer"
          },
          {
            "description": "The most recent timestamp to return result for",
            "in": "query",
            "name": "end_timestamp",
            "required": true,
            "type": "integer"
          },
          {
            "description": "Number of requested items, default - `10`",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "integer"
          },
          {
            "description": "Include trades older than 7 days, default - `false`",
            "in": "query",
            "name": "include_old",
            "required": false,
            "type": "boolean"
          },
          {
            "description": "Direction of results sorting (`default` value means no sorting, results will be returned in order in which they left the database)",
            "enum": [
              "asc",
              "desc",
              "default"
            ],
            "in": "query",
            "name": "sorting",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_trades_history_response"
            }
          }
        },
        "tags": [
          "market_data",
          "public"
        ],
        "summary": "Retrieve the latest trades that have occurred for instruments in a specific currency symbol and within given time range."
      }
    },
    "/public/get_last_trades_by_instrument": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Instrument name",
            "in": "query",
            "name": "instrument_name",
            "required": true,
            "type": "string"
          },
          {
            "description": "The sequence number of the first trade to be returned",
            "in": "query",
            "name": "start_seq",
            "required": false,
            "type": "integer"
          },
          {
            "description": "The sequence number of the last trade to be returned",
            "in": "query",
            "name": "end_seq",
            "required": false,
            "type": "integer"
          },
          {
            "description": "Number of requested items, default - `10`",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "integer"
          },
          {
            "description": "Include trades older than 7 days, default - `false`",
            "in": "query",
            "name": "include_old",
            "required": false,
            "type": "boolean"
          },
          {
            "description": "Direction of results sorting (`default` value means no sorting, results will be returned in order in which they left the database)",
            "enum": [
              "asc",
              "desc",
              "default"
            ],
            "in": "query",
            "name": "sorting",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_trades_history_response"
            }
          }
        },
        "tags": [
          "market_data",
          "public"
        ],
        "summary": "Retrieve the latest trades that have occurred for a specific instrument."
      }
    },
    "/public/get_last_trades_by_instrument_and_time": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Instrument name",
            "in": "query",
            "name": "instrument_name",
            "required": true,
            "type": "string"
          },
          {
            "description": "The earliest timestamp to return result for",
            "in": "query",
            "name": "start_timestamp",
            "required": true,
            "type": "integer"
          },
          {
            "description": "The most recent timestamp to return result for",
            "in": "query",
            "name": "end_timestamp",
            "required": true,
            "type": "integer"
          },
          {
            "description": "Number of requested items, default - `10`",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "integer"
          },
          {
            "description": "Include trades older than 7 days, default - `false`",
            "in": "query",
            "name": "include_old",
            "required": false,
            "type": "boolean"
          },
          {
            "description": "Direction of results sorting (`default` value means no sorting, results will be returned in order in which they left the database)",
            "enum": [
              "asc",
              "desc",
              "default"
            ],
            "in": "query",
            "name": "sorting",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_trades_history_response"
            }
          }
        },
        "tags": [
          "market_data",
          "public"
        ],
        "summary": "Retrieve the latest trades that have occurred for a specific instrument and within given time range."
      }
    },
    "/public/get_option_mark_prices": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The currency symbol",
            "enum": [
              "BTC",
              "ETH"
            ],
            "in": "query",
            "name": "currency",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_get_option_mark_prices_response"
            }
          }
        },
        "tags": [
          "internal"
        ],
        "summary": "Retrives market prices and its implied volatility of options instruments"
      }
    },
    "/public/get_order_book": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The instrument name for which to retrieve the order book, see [`getinstruments`](#getinstruments) to obtain instrument names.",
            "in": "query",
            "name": "instrument_name",
            "required": true,
            "type": "string"
          },
          {
            "description": "The number of entries to return for bids and asks.",
            "in": "query",
            "name": "depth",
            "required": false,
            "type": "number"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_get_order_book_response"
            }
          }
        },
        "tags": [
          "market_data",
          "public"
        ],
        "summary": "Retrieves the order book, along with other market values for a given instrument."
      }
    },
    "/public/get_time": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/get_time_response"
            }
          }
        },
        "tags": [
          "supporting",
          "public"
        ],
        "summary": "Retrieves the current time (in milliseconds). This API endpoint can be used to check the clock skew between your software and Deribit's systems."
      }
    },
    "/public/get_trade_volumes": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_get_trades_volumes_response"
            }
          }
        },
        "tags": [
          "market_data",
          "public"
        ],
        "summary": "Retrieves aggregated 24h trade volumes for different instrument types and currencies."
      }
    },
    "/public/getlasttrades": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "`\"asc\"` for ascending, `\"desc\"` for descending",
            "in": "query",
            "name": "sort",
            "required": false,
            "type": "string"
          },
          {
            "description": "Either the name of the instrument, or `\"all\"` for all active instruments, `\"futures\"` for all active futures, or `\"options\"` for all active options.",
            "in": "query",
            "name": "instrument",
            "required": true,
            "type": "string"
          },
          {
            "description": "The number of trades returned (clamped to max 10000)",
            "in": "query",
            "name": "count",
            "required": false,
            "type": "number"
          },
          {
            "description": "The ID of the first trade to be returned",
            "in": "query",
            "name": "startId",
            "required": false,
            "type": "number"
          },
          {
            "description": "The ID of the last trade to be returned",
            "in": "query",
            "name": "endId",
            "required": false,
            "type": "number"
          },
          {
            "description": "The trade sequence of the first trade to be returned",
            "in": "query",
            "name": "startSeq",
            "required": false,
            "type": "number"
          },
          {
            "description": "The trade sequence of the last trade to be returned",
            "in": "query",
            "name": "endSeq",
            "required": false,
            "type": "number"
          },
          {
            "description": "The timestamp (in ms) of the first trade to be returned",
            "in": "query",
            "name": "startTimestamp",
            "required": false,
            "type": "integer"
          },
          {
            "description": "The timestamp (in ms) of the last trade to be returned",
            "in": "query",
            "name": "endTimestamp",
            "required": false,
            "type": "integer"
          },
          {
            "description": "DEPRECATED, The ID after which trades are returned, for backward compatibility",
            "in": "query",
            "name": "since",
            "required": false,
            "type": "number"
          },
          {
            "description": "DEPRECATED, alias to \"sort\", for backward compatibility",
            "in": "query",
            "name": "direction",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_getlasttrades_response"
            }
          }
        },
        "tags": [
          "market_data",
          "public",
          "v1"
        ],
        "summary": "Retrieve the latest trades that have occurred for a specific instrument. Trades are identified in two ways:\n\n* the trade is (`tradeId`), which is unique between all instruments, but is not guaranteed to be strictly sequential.\n* the trade sequence (`tradeSeq`), which starts at 1 for each instruments, and is strictly sequential. Under rare circumstances, it is possible for the trade sequence to skip a few numbers."
      }
    },
    "/public/getorderbook": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The instrument name for which to retrieve the order book.",
            "in": "query",
            "name": "instrument",
            "required": true,
            "type": "string"
          },
          {
            "description": "The number of entries to return for bids and asks.",
            "in": "query",
            "name": "depth",
            "required": false,
            "type": "number"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_getorderbook_response"
            }
          }
        },
        "tags": [
          "market_data",
          "public",
          "v1"
        ],
        "summary": "Retrieves the order book, along with other market values for a given instrument."
      }
    },
    "/public/hello": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Client software name",
            "in": "query",
            "name": "client_name",
            "required": true,
            "type": "string"
          },
          {
            "description": "Client software version",
            "in": "query",
            "name": "client_version",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_test_response"
            }
          }
        },
        "tags": [
          "public",
          "supporting",
          "websocket_only"
        ],
        "summary": "Method used to introduce the client software connected to Deribit platform over websocket. Provided data may have an impact on the maintained connection and will be collected for internal statistical purposes. In response, Deribit will also introduce itself."
      }
    },
    "/public/ping": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/ok_response"
            }
          }
        },
        "tags": [
          "session_management",
          "public",
          "v1"
        ],
        "summary": "This API endpoint always responds with \"pong\". This method is primarily intended to be used as a keep alive message over websocket. When used over HTTP this API endpoint could also be used to measure network delays between your software and the API server."
      }
    },
    "/public/set_heartbeat": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The heartbeat interval in seconds, but not less than 10",
            "in": "query",
            "name": "interval",
            "required": true,
            "type": "number"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/ok_response"
            }
          }
        },
        "tags": [
          "public",
          "session_management",
          "websocket_only"
        ],
        "summary": "Signals the Websocket connection to send and request heartbeats. Heartbeats can be used to detect stale connections.\nWhen heartbeats have been set up, the API server will send `heartbeat` messages and `test_request` messages. Your software should respond to `test_request` messages by sending a `/api/v2/public/test` request. If your software fails to do so, the API server will immediately close the connection. If your account is configured to cancel on disconnect, any orders opened over the connection will be cancelled."
      },
      "x-order": 100
    },
    "/public/subscribe": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "collectionFormat": "multi",
            "description": "A list of channels to subscribe to.",
            "in": "query",
            "items": {
              "type": "string",
              "x-deribit-type": "channel"
            },
            "name": "channels",
            "required": true,
            "type": "array"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_subscribe_response"
            }
          },
          "401": {
            "description": "not authorised",
            "schema": {
              "$ref": "#/definitions/error_message"
            }
          }
        },
        "tags": [
          "public",
          "subscription_management",
          "websocket_only"
        ],
        "description": "Subscribe to one or more channels.\n\nThis is the same method as [/private/subscribe](#private_subscribe), but it can only\nbe used for 'public' channels.\n",
        "summary": "Subscribe to one or more channels."
      }
    },
    "/public/test": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "The value \"exception\" will trigger an error response. This may be useful for testing wrapper libraries.",
            "enum": [
              "exception"
            ],
            "in": "query",
            "name": "expected_result",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_test_response"
            }
          }
        },
        "tags": [
          "public",
          "supporting"
        ],
        "summary": "Tests the connection to the API server, and returns its version. You can use this to make sure the API is reachable, and matches the expected version."
      }
    },
    "/public/ticker": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Instrument name",
            "in": "query",
            "name": "instrument_name",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/public_ticker_response"
            }
          }
        },
        "tags": [
          "public",
          "market_data"
        ],
        "summary": "Get ticker for an instrument."
      }
    },
    "/public/unsubscribe": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "collectionFormat": "multi",
            "description": "A list of channels to unsubscribe from.",
            "in": "query",
            "items": {
              "type": "string"
            },
            "name": "channels",
            "required": true,
            "type": "array"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/private_subscribe_response"
            }
          },
          "401": {
            "description": "not authorised",
            "schema": {
              "$ref": "#/definitions/error_message"
            }
          }
        },
        "tags": [
          "websocket_only",
          "subscription_management"
        ],
        "summary": "Unsubscribe from one or more channels."
      }
    },
    "/public/validate_field": {
      "get": {
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "description": "Name of the field to be validated, examples: postal_code, date_of_birth",
            "in": "query",
            "name": "field",
            "required": true,
            "type": "string"
          },
          {
            "description": "Value to be checked",
            "in": "query",
            "name": "value",
            "required": true,
            "type": "string"
          },
          {
            "description": "Additional value to be compared with",
            "in": "query",
            "name": "value2",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "foo",
            "schema": {
              "$ref": "#/definitions/ok_response"
            }
          }
        },
        "tags": [
          "public",
          "internal"
        ],
        "summary": "Method used to introduce the client software connected to Deribit platform over websocket. Provided data may have an impact on the maintained connection and will be collected for internal statistical purposes. In response, Deribit will also introduce itself."
      }
    }
  },
  "definitions": {
    "address_book_item": {
      "properties": {
        "address": {
          "$ref": "#/definitions/currency_address"
        },
        "creation_timestamp": {
          "$ref": "#/definitions/timestamp"
        },
        "currency": {
          "$ref": "#/definitions/currency"
        },
        "type": {
          "$ref": "#/definitions/address_book_type"
        }
      },
      "required": [
        "currency",
        "address",
        "creation_timestamp"
      ],
      "type": "object"
    },
    "address_book_type": {
      "description": "Address book type",
      "enum": [
        "transfer",
        "withdrawal"
      ],
      "type": "string"
    },
    "advanced": {
      "description": "advanced type: `\"usd\"` or `\"implv\"` (Only for options; field is omitted if not applicable).\n",
      "enum": [
        "usd",
        "implv"
      ],
      "type": "string"
    },
    "amount": {
      "description": "It represents the requested order size. For perpetual and futures the amount is in USD units, for options it is amount of corresponding cryptocurrency contracts, e.g., BTC or ETH.",
      "type": "number"
    },
    "announcement_notification": {
      "properties": {
        "action": {
          "type": "string"
        },
        "body": {
          "type": "string"
        },
        "date": {
          "description": "milliseconds since the Unix epoch",
          "example": 1532593832021,
          "type": "integer"
        },
        "id": {
          "type": "integer"
        },
        "important": {
          "type": "boolean"
        },
        "number": {
          "type": "integer"
        },
        "title": {
          "type": "string"
        }
      },
      "required": [
        "title",
        "important",
        "id",
        "date",
        "body"
      ]
    },
    "api": {
      "description": "`true` if created with API",
      "type": "boolean"
    },
    "ask_iv": {
      "description": "(Only for option) implied volatility for best ask",
      "type": "number"
    },
    "asks": {
      "items": {
        "description": "List of asks",
        "type": "string"
      },
      "type": "array"
    },
    "average_price": {
      "description": "Average fill price of the order",
      "type": "number"
    },
    "base_message": {
      "properties": {
        "id": {
          "description": "The id that was sent in the request",
          "type": "integer"
        },
        "jsonrpc": {
          "description": "The JSON-RPC version (2.0)",
          "enum": [
            "2.0"
          ],
          "type": "string"
        },
        "testnet": {
          "description": "false for production server, true for test server",
          "type": "boolean",
          "x-hide-in-docs": true
        },
        "usDiff": {
          "description": "Duration of the handling of the request, in microseconds",
          "type": "integer",
          "x-hide-in-docs": true
        },
        "usIn": {
          "description": "The timestamp (in microseconds) of receipt of the request",
          "type": "integer",
          "x-hide-in-docs": true
        },
        "usOut": {
          "description": "The timestamp (in microseconds) of sending of the response",
          "type": "integer",
          "x-hide-in-docs": true
        }
      },
      "required": [
        "jsonrpc",
        "testnet",
        "usIn",
        "usOut",
        "usDiff"
      ]
    },
    "best_ask_amount": {
      "description": "It represents the requested order size of all best asks",
      "type": "number"
    },
    "best_ask_price": {
      "description": "The current best ask price, `null` if there aren't any asks",
      "type": "number"
    },
    "best_bid_amount": {
      "description": "It represents the requested order size of all best bids",
      "type": "number"
    },
    "best_bid_price": {
      "description": "The current best bid price, `null` if there aren't any bids",
      "type": "number"
    },
    "bid_iv": {
      "description": "(Only for option) implied volatility for best bid",
      "type": "number"
    },
    "bids": {
      "items": {
        "description": "List of bids",
        "type": "string"
      },
      "type": "array"
    },
    "book_entry": {
      "properties": {
        "amount": {
          "$ref": "#/definitions/amount"
        },
        "cumulative_quantity": {
          "$ref": "#/definitions/cumulative_quantity"
        },
        "cumulative_amount": {
          "$ref": "#/definitions/cumulative_amount"
        },
        "price": {
          "$ref": "#/definitions/price"
        },
        "quantity": {
          "$ref": "#/definitions/quantity"
        }
      },
      "required": [
        "amount",
        "price",
        "quantity",
        "cumulative_quantity",
        "cumulative_amount"
      ],
      "type": "object"
    },
    "book_notification": {
      "properties": {
        "asks": {
          "items": {
            "description": "The first notification will contain the amounts for all price levels (a list of [\"new\", price, amount] tuples). All following notifications will contain a list of tuples with action, price level and new amount ([action, price, amount]). Action can be 'new', 'change' or 'delete'.",
            "items": {
              "type": "number"
            },
            "type": "array"
          },
          "type": "array"
        },
        "bids": {
          "items": {
            "description": "(See 'asks' above.)",
            "items": {
              "type": "number"
            },
            "type": "array"
          },
          "type": "array"
        },
        "change_id": {
          "description": "id of the notification",
          "type": "integer"
        },
        "instrument_name": {
          "$ref": "#/definitions/instrument_name"
        },
        "timestamp": {
          "$ref": "#/definitions/timestamp_for_book_notifications"
        }
      },
      "required": [
        "instrument_name",
        "change_id",
        "asks",
        "bids"
      ]
    },
    "book_notification_raw": {
      "properties": {
        "asks": {
          "items": {
            "description": "The first notification will contain the amounts for all price levels (a list of [\"new\", price, amount] tuples). All following notifications will contain a list of tuples with action, price level and new amount ([action, price, amount]). Action can be 'new', 'change' or 'delete'.",
            "items": {
              "type": "number"
            },
            "type": "array"
          },
          "type": "array"
        },
        "bids": {
          "items": {
            "description": "(See 'asks' above.)",
            "items": {
              "type": "number"
            },
            "type": "array"
          },
          "type": "array"
        },
        "change_id": {
          "description": "id of the notification",
          "type": "integer"
        },
        "instrument_name": {
          "$ref": "#/definitions/instrument_name"
        },
        "prev_change_id": {
          "description": "id of the previous notification",
          "type": "integer"
        },
        "timestamp": {
          "$ref": "#/definitions/timestamp_for_book_notifications"
        }
      },
      "required": [
        "instrument_name",
        "change_id",
        "asks",
        "bids"
      ]
    },
    "book_state": {
      "description": "The state of the order book. Possible values are `open` and `closed`.",
      "enum": [
        "open",
        "closed"
      ],
      "type": "string"
    },
    "book_summary": {
      "properties": {
        "ask_price": {
          "description": "The current best ask price, `null` if there aren't any asks",
          "example": 7022.89,
          "type": "number"
        },
        "base_currency": {
          "description": "Base currency",
          "example": "ETH",
          "type": "string"
        },
        "bid_price": {
          "description": "The current best bid price, `null` if there aren't any bids",
          "example": 7022.89,
          "type": "number"
        },
        "creation_timestamp": {
          "$ref": "#/definitions/timestamp"
        },
        "current_funding": {
          "description": "Current funding (perpetual only)",
          "example": 0.12344,
          "type": "number"
        },
        "estimated_delivery_price": {
          "description": "Estimated delivery price, in USD (futures only). For more details, see Documentation > General > Expiration Price",
          "example": 10029.5,
          "type": "number"
        },
        "funding_8h": {
          "description": "Funding 8h (perpetual only)",
          "type": "number"
        },
        "high": {
          "description": "Price of the 24h highest trade",
          "example": 7022.89,
          "type": "number"
        },
        "instrument_name": {
          "$ref": "#/definitions/instrument_name"
        },
        "interest_rate": {
          "description": "Interest rate used in implied volatility calculations (options only)",
          "example": 0,
          "type": "number"
        },
        "last": {
          "description": "The price of the latest trade, `null` if there weren't any trades",
          "example": 7022.89,
          "type": "number"
        },
        "low": {
          "description": "Price of the 24h lowest trade, `null` if there weren't any trades",
          "example": 7022.89,
          "type": "number"
        },
        "mark_price": {
          "description": "The current instrument market price",
          "example": 7022.89,
          "type": "number"
        },
        "mid_price": {
          "description": "The average of the best bid and ask, `null` if there aren't any asks or bids",
          "example": 7022.89,
          "type": "number"
        },
        "open_interest": {
          "description": "The total amount of outstanding contracts in the corresponding amount units. For perpetual and futures the amount is in USD units, for options it is amount of corresponding cryptocurrency contracts, e.g., BTC or ETH.",
          "example": 0.5,
          "type": "number"
        },
        "quote_currency": {
          "description": "Quote currency",
          "example": "USD",
          "type": "string"
        },
        "underlying_index": {
          "description": "Name of the underlying future, or `'index_price'` (options only)",
          "example": "index_price",
          "type": "string"
        },
        "underlying_price": {
          "description": "underlying price for implied volatility calculations (options only)",
          "example": 6745.34,
          "type": "number"
        },
        "volume": {
          "description": "The total 24h traded volume (in base currency)",
          "example": 223,
          "type": "number"
        },
        "volume_usd": {
          "description": "Volume in usd (futures only)",
          "example": 102,
          "type": "number"
        }
      },
      "required": [
        "instrument_name",
        "high",
        "low",
        "base_currency",
        "quote_currency",
        "volume",
        "bid_price",
        "ask_price",
        "mid_price",
        "mark_price",
        "last",
        "open_interest",
        "creation_timestamp"
      ]
    },
    "commission": {
      "description": "Commission paid so far (in base currency)",
      "type": "number"
    },
    "continuation": {
      "description": "Continuation token for pagination.",
      "example": "xY7T6cutS3t2B9YtaDkE6TS379oKnkzTvmEDUnEUP2Msa9xKWNNaT",
      "type": "string"
    },
    "contract_size": {
      "description": "Contract size, for futures in USD, for options in BTC.",
      "example": 10,
      "type": "number"
    },
    "cumulative_amount": {
      "description": "The cumulative amount of all orders up till given price",
      "example": 8000,
      "type": "number"
    },
    "cumulative_quantity": {
      "description": "The cumulative quantity",
      "example": 800,
      "type": "number"
    },
    "currency": {
      "description": "Currency, i.e `\"BTC\"`, `\"ETH\"`",
      "enum": [
        "BTC",
        "ETH"
      ],
      "type": "string"
    },
    "currency_address": {
      "description": "Address in proper format for currency",
      "example": "1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa",
      "type": "string"
    },
    "currency_amount": {
      "description": "Amount of funds in given currency",
      "example": 1,
      "type": "number"
    },
    "currency_portfolio": {
      "properties": {
        "available_funds": {
          "type": "number"
        },
        "available_withdrawal_funds": {
          "type": "number"
        },
        "balance": {
          "type": "number"
        },
        "currency": {
          "enum": [
            "btc",
            "eth"
          ],
          "type": "string"
        },
        "equity": {
          "type": "number"
        },
        "initial_margin": {
          "type": "number"
        },
        "maintenance_margin": {
          "type": "number"
        },
        "margin_balance": {
          "type": "number"
        }
      },
      "required": [
        "margin_balance",
        "currency",
        "maintenance_margin",
        "initial_margin",
        "equity",
        "balance",
        "available_withdrawal_funds",
        "available_funds"
      ],
      "type": "object"
    },
    "currency_transaction_id": {
      "description": "Transaction id in proper format for currency, `null` if id is not available",
      "example": "1b1fb5568515e2b79503501e3d3680b2d0838d5dfc2d15a04eb8cd9fbbe0b572",
      "type": "string"
    },
    "currency_with_any": {
      "description": "Currency, i.e `\"BTC\"`, `\"ETH\"` or `\"any\"` if don't care",
      "enum": [
        "BTC",
        "ETH",
        "any"
      ],
      "type": "string"
    },
    "current_funding": {
      "description": "Current funding (perpetual only)",
      "type": "number"
    },
    "delivery_price": {
      "description": "The settlement price for the instrument. Only when `state = closed`",
      "type": "number"
    },
    "deposit": {
      "properties": {
        "address": {
          "$ref": "#/definitions/currency_address"
        },
        "amount": {
          "$ref": "#/definitions/currency_amount"
        },
        "currency": {
          "$ref": "#/definitions/currency"
        },
        "received_timestamp": {
          "$ref": "#/definitions/timestamp"
        },
        "state": {
          "$ref": "#/definitions/deposit_state"
        },
        "transaction_id": {
          "$ref": "#/definitions/currency_transaction_id"
        },
        "updated_timestamp": {
          "$ref": "#/definitions/timestamp"
        }
      },
      "required": [
        "currency",
        "address",
        "amount",
        "state",
        "transaction_id",
        "received_timestamp",
        "updated_timestamp"
      ],
      "type": "object"
    },
    "deposit_state": {
      "description": "Deposit state, allowed values : `pending`, `completed`, `rejected`, `replaced`",
      "enum": [
        "pending",
        "completed",
        "rejected",
        "replaced"
      ],
      "type": "string"
    },
    "deribit_price_index_notification": {
      "properties": {
        "index_name": {
          "example": "btc_usd",
          "type": "string"
        },
        "price": {
          "description": "Current value of Deribit Index",
          "example": 8247.27,
          "type": "number"
        },
        "timestamp": {
          "$ref": "#/definitions/timestamp"
        }
      },
      "required": [
        "timestamp",
        "price",
        "index_name"
      ]
    },
    "deribit_price_ranking_notification": {
      "items": {
        "properties": {
          "enabled": {
            "description": "Stock exchange status",
            "type": "boolean"
          },
          "identifier": {
            "description": "Stock exchange identifier",
            "example": "bitstamp",
            "type": "string"
          },
          "price": {
            "description": "Stock exchange index price",
            "type": "number"
          },
          "timestamp": {
            "description": "The timestamp of the last update from stock exchange",
            "example": 1536569522277,
            "type": "integer"
          },
          "weight": {
            "description": "The weight of the ranking given in percent",
            "type": "number"
          }
        }
      },
      "type": "array"
    },
    "direction": {
      "description": "direction, `buy` or `sell`",
      "enum": [
        "buy",
        "sell"
      ],
      "type": "string"
    },
    "error_message": {
      "properties": {
        "error": {
          "type": "integer"
        },
        "message": {
          "type": "string"
        }
      },
      "required": [
        "message",
        "error"
      ],
      "type": "object"
    },
    "estimated_expiration_price_notification": {
      "properties": {
        "is_estimated": {
          "description": "When `true` then prize is given as an estimated value, otherwise it's current index price",
          "type": "boolean"
        },
        "price": {
          "description": "Index current or estimated price",
          "example": 8247.27,
          "type": "number"
        },
        "seconds": {
          "description": "Number of seconds till finalizing the nearest instrument",
          "type": "integer"
        }
      },
      "required": [
        "seconds",
        "price",
        "is_estimated"
      ]
    },
    "fee": {
      "description": "Fee in currency",
      "example": 0.000023,
      "type": "number"
    },
    "filled_amount": {
      "description": "Filled amount of the order. For perpetual and futures the filled_amount is in USD units, for options - in units or corresponding cryptocurrency contracts, e.g., BTC or ETH.",
      "type": "number"
    },
    "filled_quantity": {
      "description": "The number of contracts to be traded.",
      "type": "number"
    },
    "funding_8h": {
      "description": "Funding 8h (perpetual only)",
      "type": "number"
    },
    "get_announcements_response": {
      "properties": {
        "result": {
          "items": {
            "properties": {
              "body": {
                "description": "The HTML body of the announcement",
                "example": "An&nbsp;announcement",
                "type": "string"
              },
              "id": {
                "description": "A unique identifier for the announcement",
                "example": 19288317,
                "type": "number"
              },
              "important": {
                "description": "Whether the announcement is marked as important",
                "example": false,
                "type": "boolean"
              },
              "publication_time": {
                "description": "The timestamp in ms at which the announcement was published",
                "example": 1527844253000,
                "type": "integer"
              },
              "title": {
                "description": "The title of the announcement",
                "example": "Example announcement",
                "type": "string"
              }
            },
            "required": [
              "title",
              "body",
              "important",
              "id",
              "publication_time"
            ],
            "type": "object"
          },
          "type": "array"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "get_time_response": {
      "properties": {
        "result": {
          "description": "Current timestamp (milliseconds)",
          "example": 1517329113791,
          "type": "integer"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "greeks": {
      "description": "Only for options",
      "properties": {
        "delta": {
          "description": "(Only for option) The delta value for the option",
          "type": "number"
        },
        "gamma": {
          "description": "(Only for option) The gamma value for the option",
          "type": "number"
        },
        "rho": {
          "description": "(Only for option) The rho value for the option",
          "type": "number"
        },
        "theta": {
          "description": "(Only for option) The theta value for the option",
          "type": "number"
        },
        "vega": {
          "description": "(Only for option) The vega value for the option",
          "type": "number"
        }
      },
      "required": [
        "delta",
        "gamma",
        "rho",
        "theta",
        "vega"
      ],
      "type": "object"
    },
    "implied_volatility": {
      "description": "Value of the volatility of the underlying instrument",
      "type": "number"
    },
    "implv": {
      "description": "Implied volatility in percent. (Only if `advanced=\"implv\"`)",
      "type": "number"
    },
    "index_price": {
      "description": "Current index price",
      "type": "number"
    },
    "instrument": {
      "properties": {
        "base_currency": {
          "description": "The underlying currency being traded.",
          "enum": [
            "BTC",
            "ETH"
          ],
          "type": "string"
        },
        "contract_size": {
          "description": "Contract size for instrument",
          "example": 1,
          "type": "number"
        },
        "creation_timestamp": {
          "description": "The time when the instrument was first created (milliseconds)",
          "example": 1536569522277,
          "type": "integer"
        },
        "expiration_timestamp": {
          "description": "The time when the instrument will expire (milliseconds)",
          "type": "integer"
        },
        "instrument_name": {
          "$ref": "#/definitions/instrument_name"
        },
        "is_active": {
          "description": "Indicates if the instrument can currently be traded.",
          "type": "boolean"
        },
        "kind": {
          "$ref": "#/definitions/kind"
        },
        "min_trade_amount": {
          "description": "Minimum amount for trading. For perpetual and futures - in USD units, for options it is amount of corresponding cryptocurrency contracts, e.g., BTC or ETH.",
          "example": 0.1,
          "type": "number"
        },
        "option_type": {
          "description": "The option type (only for options)",
          "enum": [
            "call",
            "put"
          ],
          "type": "string"
        },
        "quote_currency": {
          "description": "The currency in which the instrument prices are quoted.",
          "enum": [
            "USD"
          ],
          "type": "string"
        },
        "settlement_period": {
          "description": "The settlement period.",
          "enum": [
            "month",
            "week",
            "perpetual"
          ],
          "type": "string"
        },
        "strike": {
          "description": "The strike value. (only for options)",
          "type": "number"
        },
        "tick_size": {
          "description": "specifies minimal price change and, as follows, the number of decimal places for instrument prices",
          "example": 0.0001,
          "type": "number"
        }
      },
      "required": [
        "kind",
        "base_currency",
        "quote_currency",
        "min_trade_amount",
        "instrument_name",
        "is_active",
        "settlement_period",
        "creation_timestamp",
        "tick_size",
        "expiration_timestamp",
        "contract_size"
      ],
      "type": "object"
    },
    "instrument_name": {
      "description": "Unique instrument identifier",
      "example": "BTC-PERPETUAL",
      "type": "string"
    },
    "interest_rate": {
      "description": "Interest rate used in implied volatility calculations (options only)",
      "type": "number"
    },
    "key_number_pair": {
      "properties": {
        "name": {
          "type": "string"
        },
        "value": {
          "type": "number"
        }
      },
      "required": [
        "name",
        "value"
      ],
      "type": "object"
    },
    "kind": {
      "description": "Instrument kind, `\"future\"` or `\"option\"`",
      "enum": [
        "future",
        "option"
      ],
      "type": "string"
    },
    "kind_with_any": {
      "description": "Instrument kind, `\"future\"` or `\"option\"` or `\"any\"` if don't care",
      "enum": [
        "future",
        "option",
        "any"
      ],
      "type": "string"
    },
    "label": {
      "description": "user defined label (up to 32 characters)",
      "type": "string"
    },
    "last_price": {
      "description": "The price for the last trade",
      "type": "number"
    },
    "mark_iv": {
      "description": "(Only for option) implied volatility for mark price",
      "type": "number"
    },
    "mark_price": {
      "description": "The mark price for the instrument",
      "type": "number"
    },
    "mark_price_info": {
      "properties": {
        "instrument_name": {
          "description": "instrument name",
          "example": "BTC-27JUL18",
          "type": "string"
        },
        "iv": {
          "description": "implied volatility of mark price",
          "example": 1.23,
          "type": "number"
        },
        "mark_price": {
          "description": "mark_price of instrument",
          "example": 0.0455,
          "type": "number"
        }
      }
    },
    "markprice_options_notification": {
      "items": {
        "properties": {
          "instrument_name": {
            "$ref": "#/definitions/instrument_name"
          },
          "iv": {
            "$ref": "#/definitions/implied_volatility"
          },
          "mark_price": {
            "$ref": "#/definitions/mark_price"
          }
        },
        "type": "object"
      },
      "type": "array"
    },
    "matching_id": {
      "description": "Matching (taker) order id, `null` if it is not users order",
      "example": "100234",
      "type": "string"
    },
    "max_price": {
      "description": "The maximum price for the future. Any buy orders you submit higher than this price, will be clamped to this maximum.",
      "type": "number"
    },
    "max_show": {
      "description": "Maximum amount within an order to be shown to other traders, 0 for invisible order.",
      "type": "number"
    },
    "min_price": {
      "description": "The minimum price for the future. Any sell orders you submit lower than this price will be clamped to this minimum.",
      "type": "number"
    },
    "ok_response": {
      "properties": {
        "result": {
          "description": "Result of method execution. `ok` in case of success",
          "enum": [
            "ok"
          ],
          "type": "string"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "open_interest": {
      "description": "The total amount of outstanding contracts in the corresponding amount units. For perpetual and futures the amount is in USD units, for options it is amount of corresponding cryptocurrency contracts, e.g., BTC or ETH.",
      "type": "number"
    },
    "order": {
      "properties": {
        "advanced": {
          "$ref": "#/definitions/advanced"
        },
        "amount": {
          "$ref": "#/definitions/amount"
        },
        "api": {
          "$ref": "#/definitions/api"
        },
        "average_price": {
          "$ref": "#/definitions/average_price"
        },
        "commission": {
          "$ref": "#/definitions/commission"
        },
        "creation_timestamp": {
          "$ref": "#/definitions/timestamp"
        },
        "direction": {
          "$ref": "#/definitions/direction"
        },
        "filled_amount": {
          "$ref": "#/definitions/filled_amount"
        },
        "implv": {
          "$ref": "#/definitions/implv"
        },
        "instrument_name": {
          "$ref": "#/definitions/instrument_name"
        },
        "is_liquidation": {
          "description": "`true` if order was automatically created during liquidation",
          "type": "boolean"
        },
        "label": {
          "$ref": "#/definitions/label"
        },
        "last_update_timestamp": {
          "$ref": "#/definitions/timestamp"
        },
        "max_show": {
          "$ref": "#/definitions/max_show"
        },
        "order_id": {
          "$ref": "#/definitions/order_id"
        },
        "order_state": {
          "$ref": "#/definitions/order_state"
        },
        "order_type": {
          "$ref": "#/definitions/order_type"
        },
        "post_only": {
          "$ref": "#/definitions/post_only"
        },
        "price": {
          "$ref": "#/definitions/price"
        },
        "profit_loss": {
          "$ref": "#/definitions/profit_loss"
        },
        "reduce_only": {
          "$ref": "#/definitions/reduce_only"
        },
        "stop_price": {
          "$ref": "#/definitions/stop_price"
        },
        "time_in_force": {
          "$ref": "#/definitions/time_in_force"
        },
        "trigger": {
          "$ref": "#/definitions/trigger"
        },
        "triggered": {
          "$ref": "#/definitions/triggered"
        },
        "usd": {
          "$ref": "#/definitions/usd"
        }
      },
      "required": [
        "order_id",
        "order_state",
        "order_type",
        "time_in_force",
        "is_liquidation",
        "instrument_name",
        "creation_timestamp",
        "last_update_timestamp",
        "direction",
        "price",
        "label",
        "post_only",
        "api",
        "max_show"
      ],
      "type": "object"
    },
    "order_id": {
      "description": "Unique order identifier",
      "example": "ETH-100234",
      "type": "string"
    },
    "order_id_initial_margin_pair": {
      "properties": {
        "initial_margin": {
          "description": "Initial margin of order, in base currency",
          "type": "number"
        },
        "order_id": {
          "$ref": "#/definitions/order_id"
        }
      },
      "required": [
        "order_id",
        "initial_margin"
      ],
      "type": "object"
    },
    "order_state": {
      "description": "order state, `\"open\"`, `\"filled\"`, `\"rejected\"`, `\"cancelled\"`, `\"untriggered\"`",
      "enum": [
        "open",
        "filled",
        "rejected",
        "cancelled",
        "untriggered",
        "triggered"
      ],
      "type": "string"
    },
    "order_state_in_user_trade": {
      "description": "order state, `\"open\"`, `\"filled\"`, `\"rejected\"`, `\"cancelled\"`, `\"untriggered\"` or `\"archive\"` (if order was archived)",
      "enum": [
        "open",
        "filled",
        "rejected",
        "cancelled",
        "untriggered",
        "archive"
      ],
      "type": "string"
    },
    "order_type": {
      "description": "order type, `\"limit\"`, `\"market\"`, `\"stop_limit\"`, `\"stop_market\"`",
      "enum": [
        "market",
        "limit",
        "stop_market",
        "stop_limit"
      ],
      "type": "string"
    },
    "order_type2": {
      "description": "Order type, `\"all\"`, `\"limit\"`, `\"stop_all\"`, `\"stop_limit\"` or `\"stop_market\"`",
      "enum": [
        "all",
        "limit",
        "stop_all",
        "stop_limit",
        "stop_market"
      ],
      "type": "string"
    },
    "order_v1": {
      "properties": {
        "advanced": {
          "$ref": "#/definitions/advanced"
        },
        "api": {
          "$ref": "#/definitions/api"
        },
        "average_price": {
          "$ref": "#/definitions/average_price"
        },
        "commission": {
          "$ref": "#/definitions/commission"
        },
        "created": {
          "$ref": "#/definitions/timestamp"
        },
        "direction": {
          "$ref": "#/definitions/direction"
        },
        "filled_quantity": {
          "$ref": "#/definitions/filled_quantity"
        },
        "implv": {
          "$ref": "#/definitions/implv"
        },
        "instrument": {
          "example": "ETH-PERPETUAL",
          "type": "string"
        },
        "label": {
          "$ref": "#/definitions/label"
        },
        "last_update": {
          "$ref": "#/definitions/timestamp"
        },
        "max_show": {
          "$ref": "#/definitions/max_show"
        },
        "order_id": {
          "$ref": "#/definitions/order_id"
        },
        "order_state": {
          "$ref": "#/definitions/order_state"
        },
        "order_type": {
          "$ref": "#/definitions/order_type"
        },
        "post_only": {
          "$ref": "#/definitions/post_only"
        },
        "price": {
          "$ref": "#/definitions/price"
        },
        "quantity": {
          "$ref": "#/definitions/quantity"
        },
        "stop_price": {
          "$ref": "#/definitions/stop_price"
        },
        "trigger": {
          "$ref": "#/definitions/trigger"
        },
        "triggered": {
          "$ref": "#/definitions/triggered"
        },
        "usd": {
          "$ref": "#/definitions/usd"
        }
      },
      "required": [
        "order_id",
        "order_state",
        "order_type",
        "instrument",
        "created",
        "last_update",
        "direction",
        "price",
        "label",
        "post_only",
        "api",
        "max_show"
      ],
      "type": "object"
    },
    "perpetual_notification": {
      "properties": {
        "interest": {
          "description": "Current interest",
          "type": "number"
        }
      },
      "required": [
        "interest"
      ]
    },
    "portfolio": {
      "properties": {
        "btc": {
          "$ref": "#/definitions/currency_portfolio"
        },
        "eth": {
          "$ref": "#/definitions/currency_portfolio"
        }
      },
      "required": [
        "btc",
        "eth"
      ],
      "type": "object"
    },
    "position": {
      "properties": {
        "average_price": {
          "description": "Average price of trades that built this position",
          "type": "number"
        },
        "average_price_usd": {
          "description": "Only for options, average price in USD",
          "type": "number"
        },
        "delta": {
          "description": "Delta parameter",
          "type": "number"
        },
        "direction": {
          "$ref": "#/definitions/direction"
        },
        "estimated_liquidation_price": {
          "description": "Only for futures, estimated liquidation price",
          "type": "number"
        },
        "floating_profit_loss": {
          "description": "Floating profit or loss",
          "type": "number"
        },
        "floating_profit_loss_usd": {
          "description": "Only for options, floating profit or loss in USD",
          "type": "number"
        },
        "index_price": {
          "description": "Current index price",
          "type": "number"
        },
        "initial_margin": {
          "description": "Initial margin",
          "type": "number"
        },
        "instrument_name": {
          "$ref": "#/definitions/instrument_name"
        },
        "kind": {
          "$ref": "#/definitions/kind"
        },
        "maintenance_margin": {
          "description": "Maintenance margin",
          "type": "number"
        },
        "mark_price": {
          "description": "Current mark price for position's instrument",
          "type": "number"
        },
        "open_orders_margin": {
          "description": "Open orders margin",
          "type": "number"
        },
        "realized_profit_loss": {
          "description": "Realized profit or loss",
          "type": "number"
        },
        "settlement_price": {
          "description": "Last settlement price for position's instrument 0 if instrument wasn't settled yet",
          "type": "number"
        },
        "size": {
          "description": "Position size for futures size in quote currency (e.g. USD), for options size is in base currency (e.g. BTC)",
          "type": "number"
        },
        "size_currency": {
          "description": "Only for futures, position size in base currency",
          "type": "number"
        },
        "total_profit_loss": {
          "description": "Profit or loss from position",
          "type": "number"
        }
      },
      "required": [
        "instrument_name",
        "kind",
        "average_price",
        "direction",
        "mark_price",
        "delta",
        "index_price",
        "initial_margin",
        "maintenance_margin",
        "open_orders_margin",
        "settlement_price",
        "total_profit_loss",
        "floating_profit_loss",
        "realized_profit_loss",
        "size"
      ]
    },
    "post_only": {
      "description": "`true` for post-only orders only",
      "type": "boolean"
    },
    "price": {
      "description": "Price in base currency",
      "type": "number"
    },
    "private_account_response": {
      "properties": {
        "result": {
          "properties": {
            "available_funds": {
              "description": "The account's available funds",
              "example": 2.2638913,
              "type": "number"
            },
            "available_withdrawal_funds": {
              "description": "The account's available to withdrawal funds",
              "example": 2.26,
              "type": "number"
            },
            "balance": {
              "description": "The account's balance",
              "example": 3.4906363,
              "type": "number"
            },
            "currency": {
              "description": "The selected currency",
              "example": "ETH",
              "type": "string"
            },
            "delta_total": {
              "description": "The sum of position deltas",
              "example": 0.1334,
              "type": "number"
            },
            "deposit_address": {
              "description": "The deposit address for the account (if available)",
              "example": "14diAAyXL5UzhPTCKC998ch2GV7DMb7yDi",
              "type": "string"
            },
            "email": {
              "description": "User email (available when parameter `extended` = `true`)",
              "example": "support@deribit.com",
              "type": "string"
            },
            "equity": {
              "description": "The account's current equity",
              "example": 2.6437733,
              "type": "number"
            },
            "futures_pl": {
              "description": "Futures profit and Loss",
              "example": 0,
              "type": "number"
            },
            "futures_session_rpl": {
              "description": "Futures session realized profit and Loss",
              "example": 0,
              "type": "number"
            },
            "futures_session_upl": {
              "description": "Futures session unrealized profit and Loss",
              "example": 0,
              "type": "number"
            },
            "id": {
              "description": "Account id (available when parameter `extended` = `true`)",
              "example": 12354,
              "type": "integer"
            },
            "initial_margin": {
              "description": "The account's initial margin",
              "example": 0.379882,
              "type": "number"
            },
            "maintenance_margin": {
              "description": "The maintenance margin.",
              "example": 0.1334519,
              "type": "number"
            },
            "margin_balance": {
              "description": "The account's margin balance",
              "example": 2.25,
              "type": "number"
            },
            "options_delta": {
              "description": "Options summary delta",
              "example": 0,
              "type": "number"
            },
            "options_gamma": {
              "description": "Options summary gamma",
              "example": 0,
              "type": "number"
            },
            "options_pl": {
              "description": "Options profit and Loss",
              "example": 0,
              "type": "number"
            },
            "options_session_rpl": {
              "description": "Options session realized profit and Loss",
              "example": 0,
              "type": "number"
            },
            "options_session_upl": {
              "description": "Options session unrealized profit and Loss",
              "example": 0,
              "type": "number"
            },
            "options_theta": {
              "description": "Options summary theta",
              "example": 0,
              "type": "number"
            },
            "options_vega": {
              "description": "Options summary vega",
              "example": 0,
              "type": "number"
            },
            "portfolio_margining_enabled": {
              "description": "`true` when portfolio margining is enabled for user",
              "example": true,
              "type": "boolean"
            },
            "projected_initial_margin": {
              "description": "Projected initial margin (for portfolio margining users)",
              "example": 1,
              "type": "number"
            },
            "projected_maintenance_margin": {
              "description": "Projected maintenance margin (for portfolio margining users)",
              "example": 1,
              "type": "number"
            },
            "session_funding": {
              "description": "Session funding",
              "example": 0,
              "type": "number"
            },
            "session_rpl": {
              "description": "Session realized profit and loss",
              "example": 0.1,
              "type": "number"
            },
            "session_upl": {
              "description": "Session unrealized profit and loss",
              "example": 0.846863,
              "type": "number"
            },
            "system_name": {
              "description": "System generated user nickname (available when parameter `extended` = `true`)",
              "example": "myname",
              "type": "string"
            },
            "tfa_enabled": {
              "description": "Whether two factor authentication is enabled (available when parameter `extended` = `true`)",
              "example": false,
              "type": "boolean"
            },
            "total_pl": {
              "description": "Profit and loss",
              "example": 0.02032221,
              "type": "number"
            },
            "type": {
              "description": "Account type (available when parameter `extended` = `true`)",
              "enum": [
                "main",
                "subaccount"
              ],
              "type": "string"
            },
            "username": {
              "description": "Account name (given by user) (available when parameter `extended` = `true`)",
              "example": "name",
              "type": "string"
            }
          },
          "required": [
            "equity",
            "currency",
            "maintenance_margin",
            "initial_margin",
            "available_funds",
            "available_withdrawal_funds",
            "balance",
            "session_upl",
            "session_rpl",
            "total_pl",
            "options_pl",
            "options_session_upl",
            "options_session_rpl",
            "options_delta",
            "options_gamma",
            "options_vega",
            "options_theta",
            "futures_pl",
            "futures_session_upl",
            "futures_session_rpl",
            "session_funding",
            "delta_total",
            "tfa_enabled",
            "system_name",
            "username",
            "email",
            "type",
            "id"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_add_to_address_book_response": {
      "properties": {
        "result": {
          "$ref": "#/definitions/address_book_item"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_address_book_response": {
      "properties": {
        "result": {
          "items": {
            "$ref": "#/definitions/address_book_item"
          },
          "type": "array"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_buy_and_sell_response": {
      "properties": {
        "result": {
          "properties": {
            "order": {
              "$ref": "#/definitions/order"
            },
            "trades": {
              "items": {
                "$ref": "#/definitions/user_trade"
              },
              "type": "array"
            }
          },
          "required": [
            "order",
            "trades"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_cancel_response": {
      "properties": {
        "result": {
          "$ref": "#/definitions/order"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_create_subaccount_response": {
      "properties": {
        "result": {
          "properties": {
            "email": {
              "description": "User email",
              "example": "user_ABC@deribit.com",
              "type": "string"
            },
            "id": {
              "description": "Subaccount identifier",
              "type": "integer"
            },
            "is_password": {
              "description": "`true` when password for the subaccount has been configured",
              "type": "boolean"
            },
            "login_enabled": {
              "description": "Informs whether login to the subaccount is enabled",
              "type": "boolean"
            },
            "portfolio": {
              "$ref": "#/definitions/portfolio"
            },
            "receive_notifications": {
              "description": "When `true` - receive all notification emails on the main email",
              "type": "boolean"
            },
            "system_name": {
              "description": "System generated user nickname",
              "type": "string"
            },
            "tfa_enabled": {
              "description": "Whether the two factor authentication is enabled",
              "type": "boolean"
            },
            "type": {
              "description": "Account type",
              "enum": [
                "subaccount"
              ],
              "type": "string"
            },
            "username": {
              "description": "Account name (given by user)",
              "type": "string"
            }
          },
          "required": [
            "username",
            "type",
            "id",
            "login_enabled",
            "is_password",
            "receive_notifications",
            "system_name",
            "tfa_enabled",
            "email"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_deposit_address_response": {
      "properties": {
        "result": {
          "description": "Object if address is created, null otherwise",
          "properties": {
            "address": {
              "$ref": "#/definitions/currency_address"
            },
            "creation_timestamp": {
              "$ref": "#/definitions/timestamp"
            },
            "currency": {
              "$ref": "#/definitions/currency"
            },
            "type": {
              "$ref": "#/definitions/wallet_address_type"
            }
          },
          "required": [
            "creation_timestamp",
            "currency",
            "address",
            "type"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_edit_response": {
      "properties": {
        "result": {
          "properties": {
            "order": {
              "$ref": "#/definitions/order"
            },
            "trades": {
              "items": {
                "$ref": "#/definitions/user_trade"
              },
              "type": "array"
            }
          },
          "required": [
            "order",
            "trades"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_get_deposits_response": {
      "properties": {
        "result": {
          "properties": {
            "count": {
              "$ref": "#/definitions/result_count"
            },
            "data": {
              "items": {
                "$ref": "#/definitions/deposit"
              },
              "type": "array"
            }
          },
          "required": [
            "data",
            "count"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_get_email_language_response": {
      "properties": {
        "result": {
          "description": "The abbreviation of the language",
          "example": "en",
          "type": "string"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_get_margins_response": {
      "properties": {
        "result": {
          "properties": {
            "buy": {
              "description": "Margin when buying",
              "example": 0.01681367,
              "type": "number"
            },
            "max_price": {
              "$ref": "#/definitions/max_price"
            },
            "min_price": {
              "$ref": "#/definitions/min_price"
            },
            "sell": {
              "description": "Margin when selling",
              "example": 0.01680479,
              "type": "number"
            }
          },
          "required": [
            "buy",
            "sell",
            "min_price",
            "max_price"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_get_open_orders_response": {
      "properties": {
        "result": {
          "items": {
            "$ref": "#/definitions/order"
          },
          "type": "array"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_get_order_history_response": {
      "properties": {
        "result": {
          "items": {
            "$ref": "#/definitions/order"
          },
          "type": "array"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_get_order_margin_by_ids_response": {
      "properties": {
        "result": {
          "items": {
            "$ref": "#/definitions/order_id_initial_margin_pair"
          },
          "type": "array"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_get_order_state_response": {
      "properties": {
        "result": {
          "$ref": "#/definitions/order"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_get_position_response": {
      "properties": {
        "result": {
          "$ref": "#/definitions/position"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_get_positions_response": {
      "properties": {
        "result": {
          "items": {
            "$ref": "#/definitions/position"
          },
          "type": "array"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_get_subaccounts_response": {
      "properties": {
        "result": {
          "items": {
            "properties": {
              "email": {
                "description": "User email",
                "type": "string"
              },
              "id": {
                "description": "Account/Subaccount identifier",
                "type": "integer"
              },
              "is_password": {
                "description": "`true` when password for the subaccount has been configured",
                "type": "boolean"
              },
              "login_enabled": {
                "description": "Informs whether login to the subaccount is enabled",
                "type": "boolean"
              },
              "not_confirmed_email": {
                "description": "New email address that has not yet been confirmed. This field is only included if `with_portfolio` == `true`.",
                "type": "string"
              },
              "portfolio": {
                "$ref": "#/definitions/portfolio",
                "description": "Only if with_portfolio == true"
              },
              "receive_notifications": {
                "description": "When `true` - receive all notification emails on the main email",
                "type": "boolean"
              },
              "system_name": {
                "description": "System generated user nickname",
                "type": "string"
              },
              "tfa_enabled": {
                "description": "Whether the two factor authentication is enabled",
                "type": "boolean"
              },
              "type": {
                "enum": [
                  "main",
                  "subaccount"
                ],
                "type": "string"
              },
              "username": {
                "type": "string"
              }
            },
            "required": [
              "username",
              "email",
              "type",
              "tfa_enabled",
              "receive_notifications",
              "is_password",
              "system_name",
              "id"
            ],
            "type": "object"
          },
          "type": "array"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_get_transfers_response": {
      "properties": {
        "result": {
          "properties": {
            "count": {
              "$ref": "#/definitions/result_count"
            },
            "data": {
              "items": {
                "$ref": "#/definitions/transfer_item"
              },
              "type": "array"
            }
          },
          "required": [
            "data",
            "count"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_get_withdrawals_response": {
      "properties": {
        "result": {
          "properties": {
            "count": {
              "$ref": "#/definitions/result_count"
            },
            "data": {
              "items": {
                "$ref": "#/definitions/withdrawal"
              },
              "type": "array"
            }
          },
          "required": [
            "data",
            "count"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_getopenorders_response": {
      "properties": {
        "result": {
          "properties": {
            "adv": {
              "description": "advanced type (`false`, or `usd` or `implv`)",
              "example": "false",
              "type": "boolean"
            },
            "api": {
              "description": "true - created with API",
              "example": true,
              "type": "boolean"
            },
            "avgPrice": {
              "description": "average fill price of the order",
              "example": 10100,
              "type": "number"
            },
            "commission": {
              "description": "Commission paid so far (in BTC)",
              "example": 0,
              "type": "number"
            },
            "created": {
              "description": "The timestamp (in ms) that the order was created",
              "example": 1517614581664,
              "type": "integer"
            },
            "direction": {
              "description": "direction, `\"buy\"` or `\"sell\"`",
              "example": "buy",
              "type": "string"
            },
            "execInst": {
              "description": "Defines trigger type, required for stop limit orders, possible values `\"index_price\"`, `\"mark_price\"`  (Only valid for stop orders)",
              "example": "index_price",
              "type": "string"
            },
            "filledQuantity": {
              "description": "The number of contracts already filled",
              "example": 700,
              "type": "number"
            },
            "implv": {
              "description": "Option implied volatility in percent. (Only when `adv=implv`)",
              "example": 250,
              "type": "number"
            },
            "instrument": {
              "description": "instrument name of the order",
              "example": "BTC-23FEB18",
              "type": "string"
            },
            "label": {
              "description": "user defined label (up to 32 characters)",
              "example": "MyOrder",
              "type": "string"
            },
            "lastUpdate": {
              "description": "The timestamp (in ms) that the order was last updated",
              "example": 1517614581664,
              "type": "integer"
            },
            "max_show": {
              "description": "Maximum quantity within an order to be shown to other customers, 0 for invisible order.",
              "example": 1,
              "type": "number"
            },
            "orderId": {
              "description": "id of the order",
              "example": 713637304,
              "type": "number"
            },
            "postOnly": {
              "description": "`true` for post-only orders only",
              "example": true,
              "type": "boolean"
            },
            "price": {
              "description": "price",
              "example": 10100,
              "type": "number"
            },
            "quantity": {
              "description": "The number of contracts to be traded",
              "example": 1000,
              "type": "number"
            },
            "state": {
              "description": "order state",
              "example": "open",
              "type": "string"
            },
            "stopPx": {
              "description": "stop price (Only for future stop orders)",
              "example": 10000,
              "type": "number"
            },
            "triggered": {
              "description": "Whether the stop order has been triggered (Only for future stop orders)",
              "example": false,
              "type": "boolean"
            },
            "type": {
              "description": "order type, `\"limit\"`,` \"market\"`, `\"stop_limit\"`",
              "example": "limit",
              "type": "string"
            },
            "usd": {
              "description": "Option price in USD (Only if `adv=usd`)",
              "example": 50,
              "type": "number"
            }
          },
          "required": [
            "orderId",
            "type",
            "instrument",
            "direction",
            "price",
            "label",
            "quantity",
            "filledQuantity",
            "avgPrice",
            "commission",
            "created",
            "lastUpdate",
            "state",
            "postOnly",
            "api",
            "max_show",
            "adv",
            "implv",
            "usd",
            "stopPx",
            "execInst",
            "triggered"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_orderhistory_response": {
      "properties": {
        "result": {
          "properties": {
            "adv": {
              "description": "advanced type (`false`, or `\"usd\"` or `\"implv\"`)",
              "example": "false",
              "type": "boolean"
            },
            "api": {
              "description": "true - created with API",
              "example": true,
              "type": "boolean"
            },
            "avgPrice": {
              "description": "average fill price of the order",
              "example": 10100,
              "type": "number"
            },
            "commission": {
              "description": "Commission paid so far (in BTC)",
              "example": 0,
              "type": "number"
            },
            "created": {
              "description": "The timestamp (in ms) that the order was created",
              "example": 1517614581664,
              "type": "integer"
            },
            "direction": {
              "description": "direction, `\"buy\"` or `\"sell\"`",
              "example": "buy",
              "type": "string"
            },
            "execInst": {
              "description": "Defines trigger type, required for stop limit orders, possible values `\"index_price\"`, `\"mark_price\"`  (Only valid for stop orders)",
              "example": "index_price",
              "type": "string"
            },
            "filledQuantity": {
              "description": "The number of contracts already filled",
              "example": 700,
              "type": "number"
            },
            "implv": {
              "description": "Option implied volatility in percent. (Only when `adv=implv`)",
              "example": 250,
              "type": "number"
            },
            "instrument": {
              "description": "instrument name of the order",
              "example": "BTC-23FEB18",
              "type": "string"
            },
            "label": {
              "description": "user defined label (up to 32 characters)",
              "example": "MyOrder",
              "type": "string"
            },
            "lastUpdate": {
              "description": "The timestamp (in ms) that the order was last updated",
              "example": 1517614581664,
              "type": "integer"
            },
            "max_show": {
              "description": "Maximum quantity within an order to be shown to other customers, 0 for invisible order.",
              "example": 1,
              "type": "number"
            },
            "orderId": {
              "description": "id of the order",
              "example": 713637304,
              "type": "number"
            },
            "postOnly": {
              "description": "true for post-only orders only",
              "example": true,
              "type": "boolean"
            },
            "price": {
              "description": "price",
              "example": 10100,
              "type": "number"
            },
            "quantity": {
              "description": "The number of contracts to be traded",
              "example": 1000,
              "type": "number"
            },
            "state": {
              "description": "order state",
              "example": "open",
              "type": "string"
            },
            "stopPx": {
              "description": "stop price (Only for future stop orders)",
              "example": 10000,
              "type": "number"
            },
            "triggered": {
              "description": "Whether the stop order has been triggered (Only for future stop orders)",
              "example": false,
              "type": "boolean"
            },
            "type": {
              "description": "order type, `\"limit\"`, `\"market\"`, `\"stop_limit\"`",
              "example": "limit",
              "type": "string"
            },
            "usd": {
              "description": "Option price in USD (Only if `adv=usd`)",
              "example": 50,
              "type": "number"
            }
          },
          "required": [
            "orderId",
            "type",
            "instrument",
            "direction",
            "price",
            "label",
            "quantity",
            "filledQuantity",
            "avgPrice",
            "commission",
            "created",
            "lastUpdate",
            "state",
            "postOnly",
            "api",
            "max_show",
            "adv",
            "implv",
            "usd",
            "stopPx",
            "execInst",
            "triggered"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_orderstate_response": {
      "properties": {
        "result": {
          "properties": {
            "adv": {
              "description": "advanced type (`false`, or `\"usd\"` or `\"implv\"`)",
              "example": "false",
              "type": "boolean"
            },
            "api": {
              "description": "true - created with API",
              "example": true,
              "type": "boolean"
            },
            "avgPrice": {
              "description": "average fill price of the order",
              "example": 10100,
              "type": "number"
            },
            "commission": {
              "description": "Commission paid so far (in BTC)",
              "example": 0,
              "type": "number"
            },
            "created": {
              "description": "The timestamp (in ms) that the order was created",
              "example": 1517614581664,
              "type": "integer"
            },
            "direction": {
              "description": "direction, \"buy\" or \"sell\"",
              "example": "buy",
              "type": "string"
            },
            "execInst": {
              "description": "Defines trigger type, required for stop limit orders, possible values `\"index_price\"`, `\"mark_price\"`  (Only valid for stop orders)",
              "example": "index_price",
              "type": "string"
            },
            "filledQuantity": {
              "description": "The number of contracts already filled",
              "example": 700,
              "type": "number"
            },
            "implv": {
              "description": "Option implied volatility in percent. (Only when `adv=implv`)",
              "example": 250,
              "type": "number"
            },
            "instrument": {
              "description": "instrument name of the order",
              "example": "BTC-23FEB18",
              "type": "string"
            },
            "label": {
              "description": "user defined label (up to 32 characters)",
              "example": "MyOrder",
              "type": "string"
            },
            "lastUpdate": {
              "description": "The timestamp (in ms) that the order was last updated",
              "example": 1517614581664,
              "type": "integer"
            },
            "max_show": {
              "description": "Maximum quantity within an order to be shown to other customers, 0 for invisible order.",
              "example": 1,
              "type": "number"
            },
            "orderId": {
              "description": "id of the order",
              "example": 713637304,
              "type": "number"
            },
            "postOnly": {
              "description": "true for post-only orders only",
              "example": true,
              "type": "boolean"
            },
            "price": {
              "description": "price",
              "example": 10100,
              "type": "number"
            },
            "quantity": {
              "description": "The number of contracts to be traded",
              "example": 1000,
              "type": "number"
            },
            "state": {
              "description": "order state",
              "example": "open",
              "type": "string"
            },
            "stopPx": {
              "description": "stop price (Only for future stop orders)",
              "example": 10000,
              "type": "number"
            },
            "triggered": {
              "description": "Whether the stop order has been triggered (Only for future stop orders)",
              "example": false,
              "type": "boolean"
            },
            "type": {
              "description": "order type, `\"limit\"`, `\"market\"`, `\"stop_limit\"`",
              "example": "limit",
              "type": "string"
            },
            "usd": {
              "description": "Option price in USD (Only if `adv=usd`)",
              "example": 50,
              "type": "number"
            }
          },
          "required": [
            "orderId",
            "type",
            "instrument",
            "direction",
            "price",
            "label",
            "quantity",
            "filledQuantity",
            "avgPrice",
            "commission",
            "created",
            "lastUpdate",
            "state",
            "postOnly",
            "api",
            "max_show",
            "adv",
            "implv",
            "usd",
            "stopPx",
            "execInst",
            "triggered"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_positions_response": {
      "properties": {
        "result": {
          "properties": {
            "averagePrice": {
              "description": "average price for the position",
              "example": 9693.502194671,
              "type": "number"
            },
            "currency": {
              "description": "The base currency of the instrument",
              "example": "BTC",
              "type": "string"
            },
            "delta": {
              "description": "The position delta",
              "example": 7.14775214,
              "type": "number"
            },
            "direction": {
              "description": "The direction of the position. Can be \"buy\" (long) or \"sell\" (short)",
              "example": "buy",
              "type": "string"
            },
            "estLiqPrice": {
              "description": "Estimated liquidation price",
              "example": 99999.99,
              "type": "number"
            },
            "floatingPl": {
              "description": "floating PnL",
              "example": -0.703874042,
              "type": "number"
            },
            "indexPrice": {
              "description": "index price",
              "example": 8242.12,
              "type": "number"
            },
            "initialMargin": {
              "description": "initial margin",
              "example": 0.357387607,
              "type": "number"
            },
            "instrument": {
              "description": "name of the instrument",
              "example": "\"BTC-30MAR18\"",
              "type": "string"
            },
            "kind": {
              "description": "The type of instrument. \"future\" or \"option\"",
              "example": "future",
              "type": "string"
            },
            "maintenanceMargin": {
              "description": "maintenance margin",
              "example": 0.214432564,
              "type": "number"
            },
            "markPrice": {
              "description": "mark price",
              "example": 8244.55,
              "type": "number"
            },
            "openOrderMargin": {
              "description": "The margin used to back the position",
              "example": 0,
              "type": "number"
            },
            "profitLoss": {
              "description": "The PnL for the position",
              "example": -1.068422015,
              "type": "number"
            },
            "realizedPl": {
              "description": "realized PnL",
              "example": "0,",
              "type": "number"
            },
            "settlementPrice": {
              "description": "The settlement price for the instrument",
              "example": 9145.26,
              "type": "number"
            },
            "size": {
              "description": "The position size in contracts. Can be negative (short) or positive (long)",
              "example": 5893,
              "type": "number"
            },
            "sizeBtc": {
              "description": "position size in BTC (0 if currency <>`BTC`)",
              "example": 7.14775214,
              "type": "number"
            },
            "sizeCurrency": {
              "description": "position size in the base currency for the instrument",
              "example": 7.14775214,
              "type": "number"
            }
          },
          "required": [
            "instrument",
            "kind",
            "currency",
            "size",
            "averagePrice",
            "direction",
            "sizeBtc",
            "sizeCurrency",
            "floatingPl",
            "realizedPl",
            "estLiqPrice",
            "markPrice",
            "indexPrice",
            "maintenanceMargin",
            "initialMargin",
            "settlementPrice",
            "delta",
            "openOrderMargin",
            "profitLoss"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_remove_from_address_book_response": {
      "properties": {
        "result": {
          "description": "ok",
          "example": "ok",
          "type": "string"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_settlement_response": {
      "properties": {
        "result": {
          "items": {
            "type": "string"
          },
          "properties": {
            "continuation": {
              "$ref": "#/definitions/continuation"
            },
            "settlements": {
              "items": {
                "$ref": "#/definitions/settlement"
              },
              "type": "array"
            }
          },
          "required": [
            "continuation",
            "settlements"
          ],
          "type": "array"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_settlementhistory_response": {
      "properties": {
        "result": {
          "properties": {
            "funded": {
              "description": "Funded amount (bankruptcy only)",
              "example": "0",
              "type": "string"
            },
            "indexPrice": {
              "description": "Underlying index price at time of event (settlement and delivery only)",
              "example": 11008.37,
              "type": "number"
            },
            "instrument": {
              "description": "instrument name (settlement and delivery only)",
              "example": "BTC-30MAR18",
              "type": "string"
            },
            "markPrice": {
              "description": "Mark price for at the time  (settlement and delivery only)",
              "example": 11000,
              "type": "number"
            },
            "position": {
              "description": "position size  (settlement and delivery only)",
              "example": "1000",
              "type": "string"
            },
            "profitLoss": {
              "description": "profit and loss (settlement and delivery only)",
              "example": 0,
              "type": "number"
            },
            "sessionBankrupcy": {
              "description": "in BTC",
              "example": 0.001160788,
              "type": "number"
            },
            "sessionProfitLoss": {
              "example": "4.17243092",
              "type": "string"
            },
            "sessionTax": {
              "description": "in BTC",
              "example": "-3e-9",
              "type": "number"
            },
            "sessionTaxRate": {
              "description": "in BTC",
              "example": 0.000103333,
              "type": "number"
            },
            "socialized": {
              "description": "The amount of the losses socialized",
              "example": "-3e-9",
              "type": "number"
            },
            "timeStamp": {
              "description": "The timestamp of the settlement",
              "example": 1517299201923,
              "type": "integer"
            },
            "type": {
              "$ref": "#/definitions/settlement_type"
            }
          },
          "required": [
            "type",
            "timeStamp",
            "sessionProfitLoss",
            "position",
            "instrument",
            "indexPrice",
            "markPrice",
            "profitLoss",
            "funded",
            "socialized",
            "sessionBankrupcy",
            "sessionTaxRate",
            "sessionTax"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_submit_transfer_response": {
      "properties": {
        "result": {
          "$ref": "#/definitions/transfer_item"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_subscribe_response": {
      "properties": {
        "result": {
          "description": "A list of subscribed channels.",
          "items": {
            "example": "deribit_price_index.btc_usd",
            "type": "string"
          },
          "type": "array"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_tradehistory_response": {
      "properties": {
        "result": {
          "properties": {
            "direction": {
              "description": "Trade direction of the taker",
              "example": "buy",
              "type": "string"
            },
            "indexPrice": {
              "description": "Index price at trade",
              "example": "4101.46",
              "type": "string"
            },
            "instrument": {
              "description": "The name of the instrument",
              "example": "BTC-25AUG17-3900-C",
              "type": "string"
            },
            "iv": {
              "description": "option implied volatility for the price (Options only)",
              "example": "70.71",
              "type": "string"
            },
            "price": {
              "description": "The price of the trade",
              "example": "0.055",
              "type": "string"
            },
            "quantity": {
              "description": "The quantity traded",
              "example": "5",
              "type": "string"
            },
            "tickDirection": {
              "description": "Direction of the \"tick\".",
              "example": "1",
              "type": "string"
            },
            "timeStamp": {
              "description": "The timestamp of the trade in ms",
              "example": 1503439494351,
              "type": "integer"
            },
            "tradeId": {
              "description": "The ID for the trade",
              "example": "49366",
              "type": "string"
            },
            "tradeSeq": {
              "description": "The trade sequence number",
              "example": "1",
              "type": "string"
            }
          },
          "required": [
            "tradeId",
            "instrument",
            "tradeSeq",
            "timeStamp",
            "quantity",
            "price",
            "direction",
            "tickDirection",
            "indexPrice",
            "iv"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "private_withdraw_response": {
      "properties": {
        "result": {
          "$ref": "#/definitions/withdrawal"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "profit_loss": {
      "description": "Profit and loss in base currency.",
      "type": "number"
    },
    "public_auth_response": {
      "properties": {
        "result": {
          "properties": {
            "access_token": {
              "example": "843SehgeX5n6XxEU4XbABx4Cny5Akai5iHiJePTsvUw7",
              "type": "string"
            },
            "expires_in": {
              "description": "Token lifetime in seconds",
              "example": 315360000,
              "type": "integer"
            },
            "refresh_token": {
              "description": "Can be used to request a new token (with a new lifetime)",
              "example": "6faf8L36JdaSqsjCEEiwqifPpj6JB18RWwiWHrsGTZ91",
              "type": "string"
            },
            "scope": {
              "description": "Type of the access for assigned token",
              "type": "string"
            },
            "state": {
              "description": "Copied from the input (if applicable)",
              "type": "string"
            },
            "token_type": {
              "description": "Authorization type, allowed value - `bearer`",
              "enum": [
                "bearer"
              ],
              "type": "string"
            }
          },
          "required": [
            "access_token",
            "token_type",
            "expires_in",
            "refresh_token",
            "scope"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "public_currencies_response": {
      "properties": {
        "result": {
          "items": {
            "$ref": "#/definitions/currency"
          },
          "type": "array"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "public_get_book_summary_response": {
      "properties": {
        "result": {
          "items": {
            "$ref": "#/definitions/book_summary"
          },
          "type": "array"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "public_get_contract_size_response": {
      "properties": {
        "result": {
          "properties": {
            "contract_size": {
              "$ref": "#/definitions/contract_size"
            }
          },
          "required": [
            "contract_size"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "public_get_footer_response": {
      "properties": {
        "result": {
          "items": {
            "properties": {
              "name": {
                "type": "string"
              },
              "title_en": {
                "type": "string"
              },
              "title_ja": {
                "type": "string"
              },
              "title_ko": {
                "type": "string"
              },
              "title_ru": {
                "type": "string"
              },
              "title_zh": {
                "type": "string"
              },
              "type": {
                "type": "string"
              }
            },
            "required": [
              "title_en",
              "type",
              "name"
            ],
            "type": "object"
          },
          "type": "array"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "public_get_funding_chart_data_response": {
      "properties": {
        "result": {
          "properties": {
            "current_interest": {
              "description": "Current interest",
              "example": 0.005000670552845,
              "type": "number"
            },
            "data": {
              "items": {
                "type": "string"
              },
              "type": "array"
            },
            "index_price": {
              "description": "Current index price",
              "example": 1234.23,
              "type": "number"
            },
            "interest_8h": {
              "description": "Current interest 8h",
              "example": 0.0040080896931,
              "type": "number"
            },
            "max": {
              "description": "maximal interest",
              "example": 0.005,
              "type": "number"
            }
          },
          "required": [
            "current_interest",
            "data",
            "index_price",
            "interest_8h",
            "max"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "public_get_instruments_response": {
      "properties": {
        "result": {
          "items": {
            "$ref": "#/definitions/instrument"
          },
          "type": "array"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "public_get_option_mark_prices_response": {
      "properties": {
        "result": {
          "description": "Object with instrument names as keys and two elements arrays as value. First element in array is mark price and second one is iv.",
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "public_get_order_book_response": {
      "properties": {
        "result": {
          "$ref": "#/definitions/ticker_notification_with_bids_and_asks"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "public_get_trades_volumes_response": {
      "properties": {
        "result": {
          "items": {
            "$ref": "#/definitions/trades_volumes"
          },
          "type": "array"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "public_getlasttrades_response": {
      "properties": {
        "result": {
          "properties": {
            "direction": {
              "description": "Trade direction of the taker",
              "example": "buy",
              "type": "string"
            },
            "indexPrice": {
              "description": "Index price at trade",
              "example": "4101.46",
              "type": "string"
            },
            "instrument": {
              "description": "The name of the instrument",
              "example": "BTC-25AUG17-3900-C",
              "type": "string"
            },
            "iv": {
              "description": "option implied volatility for the price (Options only)",
              "example": "70.71",
              "type": "string"
            },
            "price": {
              "description": "The price of the trade",
              "example": "0.055",
              "type": "string"
            },
            "quantity": {
              "description": "The quantity traded",
              "example": "5",
              "type": "string"
            },
            "tickDirection": {
              "description": "Direction of the \"tick\". 0 = Plus Tick, 1 = Zero-Plus Tick, 2 = Minus Tick, 3 = Zero-Minus Tick",
              "example": "1",
              "type": "string"
            },
            "timeStamp": {
              "description": "The timestamp of the trade in ms",
              "example": 1503439494351,
              "type": "integer"
            },
            "tradeId": {
              "description": "The ID for the trade",
              "example": "49366",
              "type": "string"
            },
            "tradeSeq": {
              "description": "The trade sequence number",
              "example": "1",
              "type": "string"
            }
          },
          "required": [
            "tradeId",
            "instrument",
            "tradeSeq",
            "timeStamp",
            "quantity",
            "price",
            "direction",
            "tickDirection",
            "indexPrice",
            "iv"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "public_getorderbook_response": {
      "properties": {
        "result": {
          "properties": {
            "askIv": {
              "description": "(Only for option) implied volatility for best ask",
              "example": 130.06,
              "type": "number"
            },
            "asks": {
              "description": "The list of all asks, best ask first. See below for entry details",
              "example": "(see below)",
              "type": "array",
              "items": {
                "type": "string"
              }
            },
            "bidIv": {
              "description": "(Only for option) implied volatility for best bid",
              "example": 109.99,
              "type": "number"
            },
            "bids": {
              "description": "The list of all bids, best bid first. See below for entry details",
              "example": "(see below)",
              "items": {
                "type": "string"
              },
              "type": "array"
            },
            "cm": {
              "description": "The cumulative quantity",
              "example": 800,
              "type": "number"
            },
            "deliveryPrice": {
              "description": "The settlement price for this instrument. Only when `state=closed`",
              "example": "11013.37",
              "type": "number"
            },
            "delta": {
              "description": "(Only for options) The delta value for the option",
              "example": "-.35199",
              "type": "number"
            },
            "gamma": {
              "description": "(Only for options) The gamma value for the option",
              "example": 0.00011,
              "type": "number"
            },
            "high": {
              "description": "The 24h high for the instrument",
              "example": 10916.03,
              "type": "number"
            },
            "iR": {
              "description": "(Only for option) Interest rate used for implied volatility calculations",
              "example": 0,
              "type": "number"
            },
            "instrument": {
              "description": "The name of the instrument.",
              "example": "BTC-23FEB18",
              "type": "string"
            },
            "last": {
              "description": "The price for the last trade",
              "example": 10350,
              "type": "number"
            },
            "low": {
              "description": "The 24h low for the instrument",
              "example": 10296.11,
              "type": "number"
            },
            "mark": {
              "description": "The mark price for the instrument",
              "example": 10334.06,
              "type": "number"
            },
            "markIv": {
              "description": "(Only for option) implied volatility for mark price",
              "example": 135,
              "type": "number"
            },
            "max": {
              "description": "(Only for futures) The maximum price for the future. Any buy orders you submit higher than this price, will be clamped to this maximum.",
              "type": "number"
            },
            "min": {
              "description": "(Only for futures) The minimum price for the future. Any sell orders you submit lower than this price will be clamped to this minimum.",
              "type": "number"
            },
            "oid": {
              "description": "(Only for options)The order id of an unfilled order you have at this price. This field only shows if you have an order at this price level, and the request has been [signed](rpc-authentication.md).",
              "type": "number"
            },
            "price": {
              "description": "The price level",
              "example": 10322.5,
              "type": "number"
            },
            "quantity": {
              "description": "The total quantity of orders for this price level",
              "example": 800,
              "type": "number"
            },
            "settlementPrice": {
              "description": "The settlement price for this instrument. Only when `state=open`",
              "example": "11013.37",
              "type": "number"
            },
            "state": {
              "description": "The state of the order book. Possible values are `\"open\"` and `\"closed\"`.",
              "example": "open",
              "type": "string"
            },
            "theta": {
              "description": "(Only for option) The theta value for the option",
              "example": -6.7319,
              "type": "number"
            },
            "tstamp": {
              "description": "The order book timestamp in milliseconds",
              "example": 1517329113791,
              "type": "integer"
            },
            "uIx": {
              "description": "(Only for option) underlying future instrument name or `\"index_price\"`",
              "example": "\"BTC-30MAR18\"",
              "type": "number"
            },
            "uPx": {
              "description": "(Only for option) underlying price used for ask/bid implied volatility",
              "example": 10408.16,
              "type": "number"
            },
            "vega": {
              "description": "(Only for option) The vega value for the option",
              "example": 11.98132,
              "type": "number"
            }
          },
          "required": [
            "instrument",
            "bids",
            "asks",
            "tstamp",
            "last",
            "low",
            "high",
            "mark",
            "state",
            "settlementPrice",
            "deliveryPrice",
            "uPx",
            "uIx",
            "iR",
            "markIv",
            "askIv",
            "bidIv",
            "delta",
            "gamma",
            "vega",
            "theta",
            "max",
            "min",
            "quantity",
            "price",
            "cm",
            "oid"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "public_historical_volatility_response": {
      "properties": {
        "result": {
          "items": {
            "type": "string"
          },
          "type": "array"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "public_index_response": {
      "properties": {
        "result": {
          "properties": {
            "BTC": {
              "description": "The current index price for BTC-USD (only for selected currency == BTC)",
              "example": 11628.81,
              "type": "number"
            },
            "ETH": {
              "description": "The current index price for ETH-USD (only for selected currency == ETH)",
              "example": 328.81,
              "type": "number"
            },
            "edp": {
              "description": "Estimated delivery price for the currency. For more details, see Documentation > General > Expiration Price",
              "example": 11628.81,
              "type": "number"
            }
          },
          "required": [
            "BTC",
            "edp"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "public_test_response": {
      "properties": {
        "result": {
          "properties": {
            "version": {
              "description": "The API version",
              "example": "2.1.26",
              "type": "string"
            }
          },
          "required": [
            "version"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "public_ticker_response": {
      "properties": {
        "result": {
          "$ref": "#/definitions/ticker_notification"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "public_trade": {
      "properties": {
        "amount": {
          "description": "Trade amount. For perpetual and futures - in USD units, for options it is amount of corresponding cryptocurrency contracts, e.g., BTC or ETH.",
          "type": "number"
        },
        "direction": {
          "$ref": "#/definitions/direction",
          "description": "Trade direction of the taker"
        },
        "index_price": {
          "description": "Index Price at the moment of trade",
          "type": "number"
        },
        "instrument_name": {
          "$ref": "#/definitions/instrument_name"
        },
        "iv": {
          "description": "Option implied volatility for the price (Option only)",
          "type": "number"
        },
        "price": {
          "$ref": "#/definitions/price",
          "description": "The price of the trade"
        },
        "tick_direction": {
          "$ref": "#/definitions/tick_direction"
        },
        "timestamp": {
          "description": "The timestamp of the trade",
          "example": 1517329113791,
          "type": "integer"
        },
        "trade_id": {
          "$ref": "#/definitions/trade_id"
        },
        "trade_seq": {
          "$ref": "#/definitions/trade_seq"
        }
      },
      "required": [
        "trade_id",
        "instrument_name",
        "timestamp",
        "trade_seq",
        "direction",
        "tick_direction",
        "index_price",
        "price",
        "amount"
      ]
    },
    "public_trades_history_response": {
      "properties": {
        "result": {
          "properties": {
            "has_more": {
              "type": "boolean"
            },
            "trades": {
              "items": {
                "$ref": "#/definitions/public_trade"
              },
              "type": "array"
            }
          },
          "required": [
            "trades",
            "has_more"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "quantity": {
      "description": "The number of contracts to be traded.",
      "type": "number"
    },
    "quote_notification": {
      "properties": {
        "best_ask_amount": {
          "$ref": "#/definitions/best_ask_amount"
        },
        "best_ask_price": {
          "$ref": "#/definitions/best_ask_price"
        },
        "best_bid_amount": {
          "$ref": "#/definitions/best_bid_amount"
        },
        "best_bid_price": {
          "$ref": "#/definitions/best_bid_price"
        },
        "instrument_name": {
          "$ref": "#/definitions/instrument_name"
        },
        "timestamp": {
          "$ref": "#/definitions/timestamp"
        }
      },
      "required": [
        "timestamp",
        "instrument_name",
        "best_bid_amount",
        "best_bid_price",
        "best_ask_amount",
        "best_ask_price"
      ]
    },
    "reduce_only": {
      "description": "`true` for reduce-only orders only",
      "type": "boolean"
    },
    "result_count": {
      "description": "Total number of results available",
      "example": 101,
      "type": "integer"
    },
    "settlement": {
      "properties": {
        "funded": {
          "description": "funded amount (bankruptcy only)",
          "example": 0,
          "type": "number"
        },
        "funding": {
          "description": "funding (in base currency ; settlement for perpetual product only)",
          "example": -0.000002511,
          "type": "number"
        },
        "index_price": {
          "description": "underlying index price at time of event (in quote currency; settlement and delivery only)",
          "example": 11008.37,
          "type": "number"
        },
        "instrument_name": {
          "description": "instrument name (settlement and delivery only)",
          "example": "BTC-30MAR18",
          "type": "string"
        },
        "mark_price": {
          "description": "mark price for at the settlement time (in quote currency; settlement and delivery only)",
          "example": 11000,
          "type": "number"
        },
        "position": {
          "description": "position size (in quote currency; settlement and delivery only)",
          "example": 1000,
          "type": "number"
        },
        "profit_loss": {
          "description": "profit and loss (in base currency; settlement and delivery only)",
          "example": 0,
          "type": "number"
        },
        "session_bankrupcy": {
          "description": "value of session bankrupcy (in base currency; bankruptcy only)",
          "example": 0.001160788,
          "type": "number"
        },
        "session_profit_loss": {
          "description": "total value of session profit and losses (in base currency)",
          "example": 0.001160788,
          "type": "number"
        },
        "session_tax": {
          "description": "total amount of paid taxes/fees (in base currency; bankruptcy only)",
          "example": -0.001160788,
          "type": "number"
        },
        "session_tax_rate": {
          "description": "rate of paid texes/fees (in base currency; bankruptcy only)",
          "example": 0.000103333,
          "type": "number"
        },
        "socialized": {
          "description": "the amount of the socialized losses (in base currency; bankruptcy only)",
          "example": -0.001160788,
          "type": "number"
        },
        "timestamp": {
          "$ref": "#/definitions/timestamp"
        },
        "type": {
          "$ref": "#/definitions/settlement_type"
        }
      },
      "required": [
        "type",
        "timestamp",
        "session_profit_loss",
        "position",
        "instrument_name",
        "index_price",
        "funding"
      ],
      "type": "object"
    },
    "settlement_price": {
      "description": "The settlement price for the instrument. Only when `state = open`",
      "type": "number"
    },
    "settlement_response": {
      "properties": {
        "result": {
          "properties": {
            "continuation": {
              "$ref": "#/definitions/continuation"
            },
            "settlements": {
              "items": {
                "$ref": "#/definitions/settlement"
              },
              "type": "array"
            }
          },
          "required": [
            "continuation",
            "settlements"
          ]
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "settlement_type": {
      "description": "The type of settlement. `settlement`, `delivery` or `bankruptcy`.",
      "enum": [
        "settlement",
        "delivery",
        "bankruptcy"
      ],
      "type": "string"
    },
    "simple_order_type": {
      "description": "Order type, `\"all\"`, `\"limit\"`, `\"stop\"`",
      "enum": [
        "all",
        "limit",
        "stop"
      ],
      "type": "string"
    },
    "sorting": {
      "enum": [
        "asc",
        "desc",
        "default"
      ],
      "type": "string"
    },
    "stats": {
      "properties": {
        "high": {
          "description": "highest price during 24h",
          "type": "number"
        },
        "low": {
          "description": "lowest price during 24h",
          "type": "number"
        },
        "volume": {
          "description": "volume during last 24h in base currency",
          "type": "number"
        }
      },
      "required": [
        "volume",
        "high",
        "low"
      ],
      "type": "object"
    },
    "stop_price": {
      "description": "stop price (Only for future stop orders)",
      "type": "number"
    },
    "tick_direction": {
      "description": "Direction of the \"tick\" (`0` = Plus Tick, `1` = Zero-Plus Tick, `2` = Minus Tick, `3` = Zero-Minus Tick).",
      "enum": [
        0,
        1,
        2,
        3
      ],
      "type": "integer"
    },
    "ticker_notification": {
      "properties": {
        "ask_iv": {
          "$ref": "#/definitions/ask_iv"
        },
        "best_ask_amount": {
          "$ref": "#/definitions/best_ask_amount"
        },
        "best_ask_price": {
          "$ref": "#/definitions/best_ask_price"
        },
        "best_bid_amount": {
          "$ref": "#/definitions/best_bid_amount"
        },
        "best_bid_price": {
          "$ref": "#/definitions/best_bid_price"
        },
        "bid_iv": {
          "$ref": "#/definitions/bid_iv"
        },
        "current_funding": {
          "$ref": "#/definitions/current_funding"
        },
        "delivery_price": {
          "$ref": "#/definitions/delivery_price"
        },
        "funding_8h": {
          "$ref": "#/definitions/funding_8h"
        },
        "greeks": {
          "$ref": "#/definitions/greeks"
        },
        "index_price": {
          "$ref": "#/definitions/index_price"
        },
        "instrument_name": {
          "$ref": "#/definitions/instrument_name"
        },
        "interest_rate": {
          "$ref": "#/definitions/interest_rate"
        },
        "last_price": {
          "$ref": "#/definitions/last_price"
        },
        "mark_iv": {
          "$ref": "#/definitions/mark_iv"
        },
        "mark_price": {
          "$ref": "#/definitions/mark_price"
        },
        "max_price": {
          "$ref": "#/definitions/max_price"
        },
        "min_price": {
          "$ref": "#/definitions/min_price"
        },
        "open_interest": {
          "$ref": "#/definitions/open_interest"
        },
        "settlement_price": {
          "$ref": "#/definitions/settlement_price"
        },
        "state": {
          "$ref": "#/definitions/book_state"
        },
        "stats": {
          "$ref": "#/definitions/stats"
        },
        "timestamp": {
          "$ref": "#/definitions/timestamp"
        },
        "underlying_index": {
          "$ref": "#/definitions/underlying_index"
        },
        "underlying_price": {
          "$ref": "#/definitions/underlying_price"
        }
      },
      "required": [
        "instrument_name",
        "timestamp",
        "state",
        "stats",
        "open_interest",
        "index_price",
        "best_bid_price",
        "best_bid_amount",
        "best_ask_price",
        "best_ask_amount",
        "min_price",
        "max_price",
        "mark_price",
        "last_price"
      ]
    },
    "ticker_notification_with_bids_and_asks": {
      "properties": {
        "ask_iv": {
          "$ref": "#/definitions/ask_iv"
        },
        "asks": {
          "$ref": "#/definitions/asks"
        },
        "best_ask_amount": {
          "$ref": "#/definitions/best_ask_amount"
        },
        "best_ask_price": {
          "$ref": "#/definitions/best_ask_price"
        },
        "best_bid_amount": {
          "$ref": "#/definitions/best_bid_amount"
        },
        "best_bid_price": {
          "$ref": "#/definitions/best_bid_price"
        },
        "bid_iv": {
          "$ref": "#/definitions/bid_iv"
        },
        "bids": {
          "$ref": "#/definitions/bids"
        },
        "current_funding": {
          "$ref": "#/definitions/current_funding"
        },
        "delivery_price": {
          "$ref": "#/definitions/delivery_price"
        },
        "funding_8h": {
          "$ref": "#/definitions/funding_8h"
        },
        "greeks": {
          "$ref": "#/definitions/greeks"
        },
        "index_price": {
          "$ref": "#/definitions/index_price"
        },
        "instrument_name": {
          "$ref": "#/definitions/instrument_name"
        },
        "interest_rate": {
          "$ref": "#/definitions/interest_rate"
        },
        "last_price": {
          "$ref": "#/definitions/last_price"
        },
        "mark_iv": {
          "$ref": "#/definitions/mark_iv"
        },
        "mark_price": {
          "$ref": "#/definitions/mark_price"
        },
        "max_price": {
          "$ref": "#/definitions/max_price"
        },
        "min_price": {
          "$ref": "#/definitions/min_price"
        },
        "open_interest": {
          "$ref": "#/definitions/open_interest"
        },
        "settlement_price": {
          "$ref": "#/definitions/settlement_price"
        },
        "state": {
          "$ref": "#/definitions/book_state"
        },
        "stats": {
          "$ref": "#/definitions/stats"
        },
        "timestamp": {
          "$ref": "#/definitions/timestamp"
        },
        "underlying_index": {
          "$ref": "#/definitions/underlying_index"
        },
        "underlying_price": {
          "$ref": "#/definitions/underlying_price"
        }
      },
      "required": [
        "instrument_name",
        "timestamp",
        "state",
        "stats",
        "open_interest",
        "index_price",
        "best_bid_price",
        "best_bid_amount",
        "best_ask_price",
        "best_ask_amount",
        "min_price",
        "max_price",
        "mark_price",
        "last_price",
        "bids",
        "asks"
      ]
    },
    "time_in_force": {
      "description": "Order time in force: `\"good_til_cancelled\"`, `\"fill_or_kill\"`, `\"immediate_or_cancel\"`",
      "enum": [
        "good_til_cancelled",
        "fill_or_kill",
        "immediate_or_cancel"
      ],
      "type": "string"
    },
    "timestamp": {
      "description": "The timestamp (seconds since the Unix epoch, with millisecond precision)",
      "example": 1536569522277,
      "type": "integer"
    },
    "timestamp_for_book_notifications": {
      "description": "The timestamp of last change (seconds since the Unix epoch, with millisecond precision)",
      "example": 1536569522277,
      "type": "integer"
    },
    "trade": {
      "properties": {
        "label": {
          "description": "user defined label",
          "type": "string"
        },
        "matchingId": {
          "description": "Matching order id",
          "type": "integer"
        },
        "price": {
          "example": 8358.12,
          "type": "number"
        },
        "quantity": {
          "description": "Trade quantity",
          "type": "integer"
        },
        "selfTrade": {
          "description": "true if the trade is against own order. This can only happen when your account has self-trading enabled. Contact an administrator if you think you need that.",
          "type": "boolean"
        },
        "tradeSeq": {
          "description": "Trade sequence number for the instrument",
          "type": "integer"
        }
      },
      "required": [
        "label",
        "selfTrade",
        "quantity",
        "price",
        "tradeSeq",
        "matchingId"
      ],
      "type": "object"
    },
    "trade_id": {
      "description": "Unique (per currency) trade identifier",
      "type": "string"
    },
    "trade_seq": {
      "description": "The sequence number of the trade within instrument",
      "type": "integer"
    },
    "trades_volumes": {
      "properties": {
        "calls_volume": {
          "description": "Total 24h trade volume for call options. This is expressed in the base currency, e.g. BTC for `btc_usd`",
          "example": 2.1,
          "type": "number"
        },
        "currency_pair": {
          "description": "Currency pair: `\"btc_usd\"` or `\"eth_usd\"`",
          "enum": [
            "btc_usd",
            "eth_usd"
          ],
          "type": "string"
        },
        "futures_volume": {
          "description": "Total 24h trade volume for futures. This is expressed in the base currency, e.g. BTC for `btc_usd`",
          "example": 30.5178,
          "type": "number"
        },
        "puts_volume": {
          "description": "Total 24h trade volume for put options. This is expressed in the base currency, e.g. BTC for `btc_usd`",
          "example": 60.2,
          "type": "number"
        }
      },
      "required": [
        "currency_pair",
        "futures_volume",
        "puts_volume",
        "calls_volume"
      ],
      "type": "object"
    },
    "transfer_direction": {
      "description": "Transfer direction",
      "enum": [
        "payment",
        "income"
      ],
      "type": "string"
    },
    "transfer_id": {
      "description": "Id of transfer",
      "example": 12,
      "type": "integer"
    },
    "transfer_item": {
      "properties": {
        "amount": {
          "$ref": "#/definitions/currency_amount"
        },
        "created_timestamp": {
          "$ref": "#/definitions/timestamp"
        },
        "currency": {
          "$ref": "#/definitions/currency"
        },
        "direction": {
          "$ref": "#/definitions/transfer_direction"
        },
        "id": {
          "$ref": "#/definitions/transfer_id"
        },
        "other_side": {
          "$ref": "#/definitions/transfer_other_side"
        },
        "state": {
          "$ref": "#/definitions/transfer_state"
        },
        "type": {
          "$ref": "#/definitions/transfer_type"
        },
        "updated_timestamp": {
          "$ref": "#/definitions/timestamp"
        }
      },
      "required": [
        "currency",
        "id",
        "type",
        "amount",
        "state",
        "other_side",
        "updated_timestamp",
        "created_timestamp"
      ],
      "type": "object"
    },
    "transfer_other_side": {
      "description": "For transfer from/to subaccount returns this subaccount name, for transfer to other account returns address, for transfer from other account returns that accounts username.",
      "example": "Smith",
      "type": "string"
    },
    "transfer_state": {
      "description": "Transfer state, allowed values : `prepared`, `confirmed`, `cancelled`, `waiting_for_admin`, `rejection_reason`",
      "enum": [
        "prepared",
        "confirmed",
        "cancelled",
        "waiting_for_admin",
        "rejection_reason"
      ],
      "type": "string"
    },
    "transfer_type": {
      "description": "Type of transfer: `user` - sent to user, `subaccount` - sent to subaccount",
      "enum": [
        "user",
        "subaccount"
      ],
      "type": "string"
    },
    "trigger": {
      "description": "Trigger type (Only for stop orders). Allowed values: `\"index_price\"`, `\"mark_price\"`, `\"last_price\"`.",
      "enum": [
        "index_price",
        "mark_price",
        "last_price"
      ],
      "type": "string"
    },
    "triggered": {
      "description": "Whether the stop order has been triggered (Only for stop orders)",
      "type": "boolean"
    },
    "underlying_index": {
      "description": "Name of the underlying future, or `index_price` (options only)",
      "type": "number"
    },
    "underlying_price": {
      "description": "Underlying price for implied volatility calculations (options only)",
      "type": "number"
    },
    "usd": {
      "description": "Option price in USD (Only if `advanced=\"usd\"`)",
      "type": "number"
    },
    "user_portfolio_notification": {
      "properties": {
        "available_funds": {
          "description": "The account's available funds",
          "example": 2.2638913,
          "type": "number"
        },
        "available_withdrawal_funds": {
          "description": "The account's available to withdrawal funds",
          "example": 2.26,
          "type": "number"
        },
        "balance": {
          "description": "The account's balance",
          "example": 3.4906363,
          "type": "number"
        },
        "currency": {
          "description": "The selected currency",
          "example": "ETH",
          "type": "string"
        },
        "delta_total": {
          "description": "The sum of position deltas",
          "example": 0.1334,
          "type": "number"
        },
        "equity": {
          "description": "The account's current equity",
          "example": 2.6437733,
          "type": "number"
        },
        "futures_pl": {
          "description": "Futures profit and Loss",
          "example": 0,
          "type": "number"
        },
        "futures_session_rpl": {
          "description": "Futures session realized profit and Loss",
          "example": 0,
          "type": "number"
        },
        "futures_session_upl": {
          "description": "Futures session unrealized profit and Loss",
          "example": 0,
          "type": "number"
        },
        "initial_margin": {
          "description": "The account's initial margin",
          "example": 0.379882,
          "type": "number"
        },
        "maintenance_margin": {
          "description": "The maintenance margin.",
          "example": 0.1334519,
          "type": "number"
        },
        "margin_balance": {
          "description": "The account's margin balance",
          "example": 2.25,
          "type": "number"
        },
        "options_delta": {
          "description": "Options summary delta",
          "example": 0,
          "type": "number"
        },
        "options_gamma": {
          "description": "Options summary gamma",
          "example": 0,
          "type": "number"
        },
        "options_pl": {
          "description": "Options profit and Loss",
          "example": 0,
          "type": "number"
        },
        "options_session_rpl": {
          "description": "Options session realized profit and Loss",
          "example": 0,
          "type": "number"
        },
        "options_session_upl": {
          "description": "Options session unrealized profit and Loss",
          "example": 0,
          "type": "number"
        },
        "options_theta": {
          "description": "Options summary theta",
          "example": 0,
          "type": "number"
        },
        "options_vega": {
          "description": "Options summary vega",
          "example": 0,
          "type": "number"
        },
        "portfolio_margining_enabled": {
          "description": "When `true` portfolio margining is enabled for user",
          "example": true,
          "type": "boolean"
        },
        "projected_initial_margin": {
          "description": "Projected initial margin (for portfolio margining users)",
          "example": 1,
          "type": "number"
        },
        "projected_maintenance_margin": {
          "description": "Projected maintenance margin (for portfolio margining users)",
          "example": 1,
          "type": "number"
        },
        "session_funding": {
          "description": "Session funding",
          "example": 0,
          "type": "number"
        },
        "session_rpl": {
          "description": "Session realized profit and loss",
          "example": 0.1,
          "type": "number"
        },
        "session_upl": {
          "description": "Session unrealized profit and loss",
          "example": 0.846863,
          "type": "number"
        },
        "total_pl": {
          "description": "Profit and loss",
          "example": 0.02032221,
          "type": "number"
        }
      },
      "required": [
        "currency",
        "equity",
        "maintenance_margin",
        "initial_margin",
        "available_funds",
        "available_withdrawal_funds",
        "balance",
        "margin_balance",
        "session_upl",
        "session_rpl",
        "total_pl",
        "options_pl",
        "options_session_upl",
        "options_session_rpl",
        "options_delta",
        "options_gamma",
        "options_vega",
        "options_theta",
        "futures_pl",
        "futures_session_upl",
        "futures_session_rpl",
        "delta_total",
        "session_funding",
        "portfolio_margining_enabled"
      ]
    },
    "user_trade": {
      "properties": {
        "amount": {
          "description": "Trade amount. For perpetual and futures - in USD units, for options it is amount of corresponding cryptocurrency contracts, e.g., BTC or ETH.",
          "type": "number"
        },
        "direction": {
          "$ref": "#/definitions/direction",
          "description": "Trade direction of the taker"
        },
        "fee": {
          "description": "User's fee in units of the specified `fee_currency`",
          "type": "number"
        },
        "fee_currency": {
          "$ref": "#/definitions/currency"
        },
        "index_price": {
          "description": "Index Price at the moment of trade",
          "type": "number"
        },
        "instrument_name": {
          "$ref": "#/definitions/instrument_name"
        },
        "iv": {
          "description": "Option implied volatility for the price (Option only)",
          "type": "number"
        },
        "label": {
          "description": "User defined label (presented only when previously set for order by user)",
          "type": "string"
        },
        "liquidity": {
          "description": "Describes what was role of users order: `\"M\"` when it was maker order, `\"T\"` when it was taker order",
          "enum": [
            "M",
            "T"
          ],
          "type": "string"
        },
        "matching_id": {
          "description": "Always `null`, except for a self-trade which is possible only if self-trading is switched on for the account (in that case this will be id of the maker order of the subscriber)",
          "type": "string"
        },
        "order_id": {
          "description": "Id of the user order (maker or taker), i.e. subscriber's order id that took part in the trade",
          "type": "string"
        },
        "order_type": {
          "description": "Order type: `\"limit`, `\"market\"`, or `\"liquidation\"`",
          "enum": [
            "limit",
            "market",
            "liquidation"
          ],
          "type": "string"
        },
        "price": {
          "$ref": "#/definitions/price",
          "description": "The price of the trade"
        },
        "self_trade": {
          "description": "`true` if the trade is against own order. This can only happen when your account has self-trading enabled. Contact an administrator if you think you need that",
          "type": "boolean"
        },
        "state": {
          "$ref": "#/definitions/order_state_in_user_trade"
        },
        "tick_direction": {
          "$ref": "#/definitions/tick_direction"
        },
        "timestamp": {
          "description": "The timestamp of the trade",
          "example": 1517329113791,
          "type": "integer"
        },
        "trade_id": {
          "$ref": "#/definitions/trade_id"
        },
        "trade_seq": {
          "$ref": "#/definitions/trade_seq"
        }
      },
      "required": [
        "trade_id",
        "trade_seq",
        "instrument_name",
        "timestamp",
        "order_id",
        "matching_id",
        "self_trade",
        "direction",
        "tick_direction",
        "index_price",
        "price",
        "amount",
        "fee",
        "fee_currency",
        "state"
      ]
    },
    "user_trades_by_order_response": {
      "items": {
        "$ref": "#/definitions/user_trade"
      },
      "type": "array"
    },
    "user_trades_history_response": {
      "properties": {
        "result": {
          "properties": {
            "has_more": {
              "type": "boolean"
            },
            "trades": {
              "items": {
                "$ref": "#/definitions/user_trade"
              },
              "type": "array"
            }
          },
          "required": [
            "trades",
            "has_more"
          ],
          "type": "object"
        }
      },
      "required": [
        "result"
      ],
      "type": "object"
    },
    "wallet_address_type": {
      "description": "Address type/purpose, allowed values : `deposit`, `withdrawal`, `transfer`",
      "enum": [
        "deposit",
        "withdrawal",
        "transfer"
      ],
      "type": "string"
    },
    "withdrawal": {
      "properties": {
        "address": {
          "$ref": "#/definitions/currency_address"
        },
        "amount": {
          "$ref": "#/definitions/currency_amount"
        },
        "confirmed_timestamp": {
          "description": "The timestamp (seconds since the Unix epoch, with millisecond precision) of withdrawal confirmation, `null` when not confirmed",
          "example": 1536569522277,
          "type": "integer"
        },
        "created_timestamp": {
          "$ref": "#/definitions/timestamp"
        },
        "currency": {
          "$ref": "#/definitions/currency"
        },
        "fee": {
          "$ref": "#/definitions/fee"
        },
        "id": {
          "description": "Withdrawal id in Deribit system",
          "example": 1,
          "type": "integer"
        },
        "priority": {
          "description": "Id of priority level",
          "example": 1,
          "type": "number"
        },
        "state": {
          "$ref": "#/definitions/withdrawal_state"
        },
        "transaction_id": {
          "$ref": "#/definitions/currency_transaction_id"
        },
        "updated_timestamp": {
          "$ref": "#/definitions/timestamp"
        }
      },
      "required": [
        "currency",
        "address",
        "amount",
        "state",
        "transaction_id",
        "confirmed_timestamp",
        "updated_timestamp"
      ],
      "type": "object"
    },
    "withdrawal_state": {
      "description": "Withdrawal state, allowed values : `unconfirmed`, `confirmed`, `cancelled`, `completed`, `interrupted`, `rejected`",
      "enum": [
        "unconfirmed",
        "confirmed",
        "cancelled",
        "completed",
        "interrupted",
        "rejected"
      ],
      "type": "string"
    }
  },
  "tags": [
    {
      "description": "API V1 request",
      "name": "v1"
    },
    {
      "description": "Can only be used over websockets.",
      "name": "websocket_only"
    },
    {
      "description": "Public methods can be used without authentication.",
      "name": "public"
    },
    {
      "description": "<p>Private methods require authentication. All requests must include a valid OAuth2 token.</p>\n<p>A token can be requested using the <a href=\"#public-auth\">/public/auth</a> method.</p>\n<p>When using the websockets protocol, the token must be included as a parameter <code>access_token</code> in the message. When using REST (HTTP GET), the token may also be passed in the <code>Authorization</code> header.</p>",
      "name": "private"
    },
    {
      "description": "Not intended for public use; do not include in publicly available documentation.",
      "name": "internal"
    },
    {
      "name": "authentication"
    },
    {
      "name": "session_management"
    },
    {
      "description": "Subscription works as [notifications](#notifications), so users will automatically (after subscribing) receive messages from the server. Overview for each channel response format is described in [subscriptions](#subscriptions) section.",
      "name": "subscription_management"
    },
    {
      "name": "account_management"
    },
    {
      "name": "trading"
    },
    {
      "name": "market_data"
    },
    {
      "name": "wallet"
    }
  ],
  "x-components": {
    "parameters": {
      "address_book_type": {
        "description": "Address book type",
        "enum": [
          "transfer",
          "withdrawal"
        ],
        "in": "query",
        "name": "type",
        "required": true,
        "type": "string"
      },
      "address_name": {
        "description": "Name of address book entry",
        "in": "query",
        "name": "name",
        "required": true,
        "type": "string"
      },
      "advanced_order_type": {
        "description": "Advanced option order type. (Only for options)",
        "enum": [
          "usd",
          "implv"
        ],
        "in": "query",
        "name": "advanced",
        "required": false,
        "type": "string"
      },
      "boolean_state": {
        "in": "query",
        "name": "state",
        "required": true,
        "type": "boolean"
      },
      "client_software_name": {
        "description": "Client software name",
        "in": "query",
        "name": "client_name",
        "required": true,
        "type": "string"
      },
      "client_software_version": {
        "description": "Client software version",
        "in": "query",
        "name": "client_version",
        "required": true,
        "type": "string"
      },
      "continuation": {
        "description": "Continuation token for pagination",
        "in": "query",
        "name": "continuation",
        "required": false,
        "type": "string"
      },
      "currency": {
        "description": "The currency symbol",
        "enum": [
          "BTC",
          "ETH"
        ],
        "in": "query",
        "name": "currency",
        "required": true,
        "type": "string"
      },
      "currency_address_from_address_book": {
        "description": "Address in currency format, it must be in address book",
        "in": "query",
        "name": "address",
        "required": true,
        "type": "string"
      },
      "currency_with_any": {
        "description": "The currency symbol or `\"any\"` for all",
        "in": "query",
        "name": "currency",
        "required": true,
        "schema": {
          "$ref": "#/definitions/currency_with_any"
        }
      },
      "edit_advanced_order_type": {
        "description": "Advanced option order type. If you have posted an advanced option order, it is necessary to re-supply this parameter when editing it (Only for options)",
        "enum": [
          "usd",
          "implv"
        ],
        "in": "query",
        "name": "advanced",
        "required": false,
        "type": "string"
      },
      "edit_order_price": {
        "description": "<p>The order price in base currency.</p> <p>When editing an option order with advanced=usd, the field price should be the option price value in USD.</p> <p>When editing an option order with advanced=implv, the field price should be a value of implied volatility in percentages. For example,  price=100, means implied volatility of 100%</p>",
        "in": "query",
        "name": "price",
        "required": true,
        "type": "number"
      },
      "end_timestamp": {
        "description": "The most recent timestamp to return result for",
        "in": "query",
        "name": "end_timestamp",
        "required": true,
        "type": "integer"
      },
      "index_name": {
        "description": "Index identifier, matches (base) cryptocurrency with quote currency",
        "in": "query",
        "name": "index_name",
        "required": true,
        "schema": {
          "enum": [
            "btc_usd",
            "eth_usd"
          ],
          "type": "string"
        }
      },
      "instrument_name": {
        "description": "Instrument name",
        "in": "query",
        "name": "instrument_name",
        "required": true,
        "type": "string"
      },
      "kind_with_any": {
        "description": "Instrument kind or `\"any\"` for all",
        "in": "query",
        "name": "kind",
        "required": true,
        "schema": {
          "$ref": "#/definitions/kind_with_any"
        }
      },
      "length_for_perpetual_chart": {
        "description": "Specifies time period. `8h` - 8 hours, `24h` - 24 hours",
        "enum": [
          "8h",
          "24h"
        ],
        "in": "query",
        "name": "length",
        "required": false,
        "type": "string"
      },
      "max_show": {
        "default": 1,
        "description": "Maximum amount within an order to be shown to other customers, `0` for invisible order",
        "in": "query",
        "name": "max_show",
        "required": false,
        "type": "number"
      },
      "optional_count10": {
        "description": "Number of requested items, default - `10`",
        "in": "query",
        "name": "count",
        "required": false,
        "type": "integer"
      },
      "optional_count20": {
        "description": "Number of requested items, default - `20`",
        "in": "query",
        "name": "count",
        "required": false,
        "type": "integer"
      },
      "optional_currency": {
        "description": "The currency symbol",
        "in": "query",
        "name": "currency",
        "required": false,
        "schema": {
          "$ref": "#/definitions/currency"
        }
      },
      "optional_end_seq": {
        "description": "The sequence number of the last trade to be returned",
        "in": "query",
        "name": "end_seq",
        "required": false,
        "type": "integer"
      },
      "optional_end_trade_id": {
        "description": "The ID number of the last trade to be returned",
        "in": "query",
        "name": "end_id",
        "required": false,
        "type": "string"
      },
      "optional_include_old_orders": {
        "description": "Include in result orders older than 2 days, default - `false`",
        "in": "query",
        "name": "include_old",
        "required": false,
        "type": "boolean"
      },
      "optional_include_old_trades": {
        "description": "Include trades older than 7 days, default - `false`",
        "in": "query",
        "name": "include_old",
        "required": false,
        "type": "boolean"
      },
      "optional_include_unfilled_orders": {
        "description": "Include in result fully unfilled closed orders, default - `false`",
        "in": "query",
        "name": "include_unfilled",
        "required": false,
        "type": "boolean"
      },
      "optional_instrument_name": {
        "description": "Instrument name",
        "in": "query",
        "name": "instrument_name",
        "required": false,
        "schema": {
          "$ref": "#/definitions/instrument_name"
        }
      },
      "optional_kind": {
        "description": "Instrument kind, if not provided instruments of all kinds are considered",
        "enum": [
          "future",
          "option"
        ],
        "in": "query",
        "name": "kind",
        "required": false,
        "type": "string"
      },
      "optional_offset": {
        "description": "The offset for pagination, default - `0`",
        "in": "query",
        "name": "offset",
        "required": false,
        "type": "integer"
      },
      "optional_order_type": {
        "description": "Order type, default - `all`",
        "enum": [
          "all",
          "limit",
          "stop_all",
          "stop_limit",
          "stop_market"
        ],
        "in": "query",
        "name": "type",
        "required": false,
        "type": "string"
      },
      "optional_price": {
        "description": "Optional price for limit order.",
        "in": "query",
        "name": "price",
        "required": false,
        "type": "number"
      },
      "optional_settlement_start_timestamp": {
        "description": "The latest timestamp to return result for",
        "in": "query",
        "name": "search_start_timestamp",
        "required": false,
        "type": "integer"
      },
      "optional_settlement_type": {
        "description": "Settlement type",
        "enum": [
          "settlement",
          "delivery",
          "bankruptcy"
        ],
        "in": "query",
        "name": "type",
        "required": false,
        "type": "string"
      },
      "optional_simple_order_type": {
        "description": "Order type - limit, stop or all, default - `all`",
        "enum": [
          "all",
          "limit",
          "stop"
        ],
        "in": "query",
        "name": "type",
        "required": false,
        "type": "string"
      },
      "optional_sorting": {
        "description": "Direction of results sorting (`default` value means no sorting, results will be returned in order in which they left the database)",
        "enum": [
          "asc",
          "desc",
          "default"
        ],
        "in": "query",
        "name": "sorting",
        "required": false,
        "type": "string"
      },
      "optional_start_seq": {
        "description": "The sequence number of the first trade to be returned",
        "in": "query",
        "name": "start_seq",
        "required": false,
        "type": "integer"
      },
      "optional_start_trade_id": {
        "description": "The ID number of the first trade to be returned",
        "in": "query",
        "name": "start_id",
        "required": false,
        "type": "string"
      },
      "order_id": {
        "description": "The order id",
        "in": "query",
        "name": "order_id",
        "required": true,
        "type": "string"
      },
      "order_label": {
        "description": "user defined label for the order (maximum 32 characters)",
        "in": "query",
        "name": "label",
        "required": false,
        "type": "string"
      },
      "order_price": {
        "description": "<p>The order price in base currency (Only for limit and stop_limit orders)</p> <p>When adding order with advanced=usd, the field price should be the option price value in USD.</p> <p>When adding order with advanced=implv, the field price should be a value of implied volatility in percentages. For example,  price=100, means implied volatility of 100%</p>",
        "in": "query",
        "name": "price",
        "required": false,
        "type": "number"
      },
      "order_quantity": {
        "description": "It represents the requested order size. For perpetual and futures the amount is in USD units, for options it is amount of corresponding cryptocurrency contracts, e.g., BTC or ETH",
        "in": "query",
        "name": "amount",
        "required": true,
        "type": "number"
      },
      "order_type": {
        "description": "The order type, default: `\"limit\"`",
        "enum": [
          "limit",
          "stop_limit",
          "market",
          "stop_market"
        ],
        "in": "query",
        "name": "type",
        "required": false,
        "type": "string"
      },
      "post_only": {
        "default": true,
        "description": "<p>If true, the order is considered post-only. If the new price would cause the order to be filled immediately (as taker), the price will be changed to be just below the bid.</p> <p>Only valid in combination with time_in_force=`\"good_til_cancelled\"`</p>",
        "in": "query",
        "name": "post_only",
        "required": false,
        "type": "boolean"
      },
      "reduce_only": {
        "default": false,
        "description": "If `true`, the order is considered reduce-only which is intended to only reduce a current position",
        "in": "query",
        "name": "reduce_only",
        "required": false,
        "type": "boolean"
      },
      "simple_order_type_market_limit": {
        "description": "The order type",
        "enum": [
          "limit",
          "market"
        ],
        "in": "query",
        "name": "type",
        "required": true,
        "type": "string"
      },
      "start_timestamp": {
        "description": "The earliest timestamp to return result for",
        "in": "query",
        "name": "start_timestamp",
        "required": true,
        "type": "integer"
      },
      "stop_price": {
        "description": "Stop price, required for stop limit orders (Only for stop orders)",
        "in": "query",
        "name": "stop_price",
        "required": false,
        "type": "number"
      },
      "subscription_interval": {
        "description": "Frequency of notifications. Events will be aggregated over this interval. The value `raw` means no aggregation will be applied",
        "in": "query",
        "name": "interval",
        "required": true,
        "schema": {
          "enum": [
            "100ms",
            "raw"
          ],
          "type": "string"
        }
      },
      "tfa": {
        "description": "TFA code, required when TFA is enabled for current account",
        "in": "query",
        "name": "tfa",
        "required": false,
        "type": "string"
      },
      "time_in_force": {
        "default": "good_til_cancelled",
        "description": "<p>Specifies how long the order remains in effect. Default `\"good_til_cancelled\"`</p> <ul> <li>`\"good_til_cancelled\"` - unfilled order remains in order book until cancelled</li> <li>`\"fill_or_kill\"` - execute a transaction immediately and completely or not at all</li> <li>`\"immediate_or_cancel\"` - execute a transaction immediately, and any portion of the order that cannot be immediately filled is cancelled</li> </ul>",
        "enum": [
          "good_til_cancelled",
          "fill_or_kill",
          "immediate_or_cancel"
        ],
        "in": "query",
        "name": "time_in_force",
        "required": false,
        "type": "string"
      },
      "transfer_currency_amount": {
        "description": "Amount of funds to be transferred",
        "in": "query",
        "name": "amount",
        "required": true,
        "type": "number"
      },
      "transfer_destination_for_subaccount": {
        "description": "Id of destination subaccount",
        "in": "query",
        "name": "destination",
        "required": true,
        "type": "integer"
      },
      "transfer_destination_for_user": {
        "description": "Destination address from address book",
        "in": "query",
        "name": "destination",
        "required": true,
        "type": "string"
      },
      "transfer_direction": {
        "description": "Direction of transfer",
        "in": "query",
        "name": "direction",
        "required": true,
        "schema": {
          "$ref": "#/definitions/transfer_direction"
        }
      },
      "transfer_id": {
        "description": "Id of transfer",
        "in": "query",
        "name": "id",
        "required": true,
        "type": "integer"
      },
      "trigger": {
        "description": "Defines trigger type, required for `\"stop_limit\"` order type",
        "enum": [
          "index_price",
          "mark_price",
          "last_price"
        ],
        "in": "query",
        "name": "trigger",
        "required": false,
        "type": "string"
      },
      "withdrawal_currency_amount": {
        "description": "Amount of funds to be withdrawn",
        "in": "query",
        "name": "amount",
        "required": true,
        "type": "number"
      },
      "withdrawal_id": {
        "description": "The withdrawal id",
        "in": "query",
        "name": "id",
        "required": true,
        "type": "number"
      },
      "withdrawal_priority": {
        "description": "Withdrawal priority, optional for BTC, default: `high`",
        "enum": [
          "insane",
          "extreme_high",
          "very_high",
          "high",
          "mid",
          "low",
          "very_low"
        ],
        "in": "query",
        "name": "priority",
        "required": false,
        "type": "string"
      }
    },
    "x-sections": {
      "subscriptions": {
        "introduction": "#Subscriptions\n\nThe [subscribe](#private-subscribe) method can be used to subscribe to one \nor more *channels*. This section provides an overview of the channels and\nthe notifications that the subscriber will receive for each of those channels.\n\nIn most cases the channel name is constructed from a couple \nof elements. This makes it possible to specify exactly which\ninformation is required, and/or the frequency or aggregation level.\nThese elements are considered parameters for the subscription.\n\nFor example, when subscribing to the channel\n<code>book.BTC-27JUL18.10.20.100ms</code>, the element\n<code>BTC-27JUL18</code> specifies that the name of the instrument\n(see [naming](#naming)), <code>10</code> means that the results\nshould be grouped to that precision, etc.\n\nAs described in [notifications](#notifications), response data includes fields \nrequired by JSON-RPC and part dedicated for subscription data. \n\n<p>\n  <table>\n      <thead>\n          <tr>\n              <th>Name</th>\n              <th>Type</th>\n              <th>Description</th>\n          </tr>\n      </thead>\n      <tbody>\n          <tr>\n              <td>jsonrpc</td>\n              <td>string</td>\n              <td>The JSON-RPC version (2.0)</td>\n          </tr>\n          <tr>\n              <td>method</td>\n              <td>string</td>\n              <td>Here it's always <code>subscription</code></td>\n          </tr>\n          <tr>\n              <td>params</td>\n              <td><em>object</em></td>\n              <td></td>\n          </tr>\n          <tr>\n              <td>&nbsp;&nbsp;›&nbsp;&nbsp;channel</td>\n              <td>string</td>\n              <td>The same channel as given when subscribing to notifications</td>\n          </tr>\n          <tr>\n              <td>&nbsp;&nbsp;›&nbsp;&nbsp;data</td>\n              <td><em>object</em></td>\n              <td>Data specific for the channel</td>\n          </tr>\n      </tbody>\n  </table>\n</p>\n\nFor all the following channel types only specific <code>data</code> part will be described.\n"
      }
    },
    "x-subscriptions": {
      "announcements": {
        "tags": [
          "private"
        ],
        "notifications": {
          "schema": {
            "$ref": "#/definitions/announcement_notification"
          }
        },
        "summary": "General announcements concerning the Deribit platform."
      },
      "book.{instrument_name}.{group}.{depth}.{interval}": {
        "parameters": [
          {
            "$ref": "#/x-components/parameters/instrument_name"
          },
          {
            "description": "Group prices (by rounding). Use <code>none</code> for no grouping.<br>",
            "name": "group",
            "required": true,
            "schema": {
              "enum": [
                "none",
                1,
                2,
                5,
                10
              ],
              "example": 10,
              "type": "string"
            },
            "summary": "Group prices (by rounding). Use 'none' for no grouping."
          },
          {
            "description": "Number of price levels to be included.",
            "name": "depth",
            "required": true,
            "schema": {
              "enum": [
                1,
                10,
                20
              ],
              "example": 20,
              "type": "integer"
            }
          },
          {
            "description": "Frequency of notifications. Events will be aggregated over this interval.",
            "name": "interval",
            "required": true,
            "schema": {
              "enum": [
                "100ms"
              ],
              "type": "string"
            }
          }
        ],
        "description": "<p>Notifies about changes to the order book for a certain instrument.</p>\nNotifications are sent once per specified interval, with prices grouped by (rounded to) the specified group, showing the complete order book to the specified depth (number of price levels).</p>\n<p>The 'asks' and the 'bids' elements in the response are both a 'list of lists'. Each element in the outer list is a list of exactly two elements: price and amount.</p>\n<p>*price* is a price level (USD per BTC, rounded as specified by the 'group' parameter for the susbcription).</p>\n<p>*amount* indicates the amount of all orders at price level. For perpetual and futures the amount is in USD units, for options it is amount of corresponding cryptocurrency contracts, e.g., BTC or ETH.</p>",
        "notifications": {
          "examples": {
            "firstObject": {
              "externalValue": "examples/notifications/book.instrument_name.group.depth.interval.first.json"
            },
            "repeatedObject": {
              "externalValue": "examples/notifications/book.instrument_name.group.depth.interval.repeated.json"
            }
          },
          "schema": {
            "$ref": "#/definitions/book_notification"
          }
        },
        "summary": "Aggregated notifications about changes to the order book for a certain instrument."
      },
      "book.{instrument_name}.{interval}": {
        "parameters": [
          {
            "$ref": "#/x-components/parameters/instrument_name"
          },
          {
            "description": "Frequency of notifications. Events will be aggregated over this interval.",
            "name": "interval",
            "required": true,
            "schema": {
              "enum": [
                "raw",
                "100ms"
              ],
              "type": "string"
            }
          }
        ],
        "description": "<p>Notifies about changes to the order book for a certain instrument.</p>\n<p>The first notification will contain the whole book (bid and ask amounts for all prices). After that there will only be information about changes to individual price levels.</p>\n<p>The first notification will contain the amounts for all price levels (list of <code>['new', price, amount]</code> tuples). All following notifications will contain a list of tuples with action, price level and new amount (<code>[action, price, amount]</code>). Action can be either <code>new</code>, <code>change</code> or <code>delete</code>.\n<p>Each notification will contain a <code>change_id</code> field, and each message except for the first one will contain a field <code>prev_change_id</code>. If <code>prev_change_id</code> is equal to the <code>change_id</code> of the previous message, this means that no messages have been missed.</p>\n<p>The amount for perpetual and futures is in USD units, for options it is in corresponding cryptocurrency contracts, e.g., BTC or ETH.</p>",
        "notifications": {
          "examples": {
            "firstObject": {
              "externalValue": "examples/notifications/book.instrument_name.interval.first.json"
            },
            "repeatedObject": {
              "externalValue": "examples/notifications/book.instrument_name.interval.repeated.json"
            }
          },
          "schema": {
            "$ref": "#/definitions/book_notification_raw"
          }
        },
        "summary": "Notifies about changes to the order book for a certain instrument."
      },
      "deribit_price_index.{index_name}": {
        "parameters": [
          {
            "$ref": "#/x-components/parameters/index_name"
          }
        ],
        "description": "Provides information about current value (price) for Deribit Index",
        "notifications": {
          "examples": {
            "repeatedObject": {
              "externalValue": "examples/notifications/deribit_price_index.index_name.repeated.json"
            }
          },
          "schema": {
            "$ref": "#/definitions/deribit_price_index_notification"
          }
        }
      },
      "deribit_price_ranking.{index_name}": {
        "parameters": [
          {
            "$ref": "#/x-components/parameters/index_name"
          }
        ],
        "description": "Provides information about current value (price) for stock exchanges used to calculate Deribit Index",
        "notifications": {
          "examples": {
            "repeatedObject": {
              "externalValue": "examples/notifications/deribit_price_ranking.index_name.repeated.json"
            }
          },
          "schema": {
            "$ref": "#/definitions/deribit_price_ranking_notification"
          }
        }
      },
      "estimated_expiration_price.{index_name}": {
        "parameters": [
          {
            "$ref": "#/x-components/parameters/index_name"
          }
        ],
        "description": "Returns calculated (estimated) ending price for given index.",
        "notifications": {
          "examples": {
            "repeatedObject": {
              "externalValue": "examples/notifications/estimated_expiration_price.index_name.repeated.json"
            }
          },
          "schema": {
            "$ref": "#/definitions/estimated_expiration_price_notification"
          }
        }
      },
      "markprice.options.{index_name}": {
        "parameters": [
          {
            "$ref": "#/x-components/parameters/index_name"
          }
        ],
        "notifications": {
          "examples": {
            "repeatedObject": {
              "externalValue": "examples/notifications/markprice.options.index_name.repeated.json"
            }
          },
          "schema": {
            "$ref": "#/definitions/markprice_options_notification"
          }
        },
        "summary": "Provides information about options markprices."
      },
      "perpetual.{instrument_name}.{interval}": {
        "parameters": [
          {
            "$ref": "#/x-components/parameters/instrument_name"
          },
          {
            "$ref": "#/x-components/parameters/subscription_interval"
          }
        ],
        "notifications": {
          "examples": {
            "repeatedObject": {
              "externalValue": "examples/notifications/perpetual.instrument_name.interval.repeated.json"
            }
          },
          "schema": {
            "$ref": "#/definitions/perpetual_notification"
          }
        },
        "summary": "Provide current interest rate - but only for **perpetual** instruments. Other types won't generate any notification."
      },
      "quote.{instrument_name}": {
        "parameters": [
          {
            "$ref": "#/x-components/parameters/instrument_name"
          }
        ],
        "notifications": {
          "examples": {
            "repeatedObject": {
              "externalValue": "examples/notifications/quote.instrument_name.repeated.json"
            }
          },
          "schema": {
            "$ref": "#/definitions/quote_notification"
          }
        },
        "summary": "Best bid/ask price and size."
      },
      "ticker.{instrument_name}.{interval}": {
        "parameters": [
          {
            "$ref": "#/x-components/parameters/instrument_name"
          },
          {
            "$ref": "#/x-components/parameters/subscription_interval"
          }
        ],
        "notifications": {
          "examples": {
            "repeatedObject": {
              "externalValue": "examples/notifications/ticker.instrument_name.interval.repeated.json"
            }
          },
          "schema": {
            "$ref": "#/definitions/ticker_notification"
          }
        },
        "summary": "Key information about the instrument"
      },
      "trades.{instrument_name}.{interval}": {
        "parameters": [
          {
            "$ref": "#/x-components/parameters/instrument_name"
          },
          {
            "$ref": "#/x-components/parameters/subscription_interval"
          }
        ],
        "notifications": {
          "examples": {
            "repeatedObject": {
              "externalValue": "examples/notifications/trades.instrument_name.interval.repeated.json"
            }
          },
          "schema": {
            "$ref": "#/definitions/public_trade"
          }
        },
        "summary": "Get notifications about trades for an instrument."
      },
      "user.orders.{instrument_name}.{interval}": {
        "parameters": [
          {
            "$ref": "#/x-components/parameters/instrument_name"
          },
          {
            "$ref": "#/x-components/parameters/subscription_interval"
          }
        ],
        "tags": [
          "private"
        ],
        "notifications": {
          "examples": {
            "repeatedObject": {
              "externalValue": "examples/notifications/user.orders.instrument_name.interval.repeated.json"
            }
          },
          "schema": {
            "$ref": "#/definitions/order"
          }
        },
        "summary": "Get notifications about changes in user's orders for given instrument."
      },
      "user.orders.{kind}.{currency}.{interval}": {
        "parameters": [
          {
            "$ref": "#/x-components/parameters/kind_with_any"
          },
          {
            "$ref": "#/x-components/parameters/currency_with_any"
          },
          {
            "$ref": "#/x-components/parameters/subscription_interval"
          }
        ],
        "tags": [
          "private"
        ],
        "notifications": {
          "examples": {
            "repeatedObject": {
              "externalValue": "examples/notifications/user.orders.kind.currency.interval.repeated.json"
            }
          },
          "schema": {
            "$ref": "#/definitions/order"
          }
        },
        "summary": "Get notifications about changes in user's orders in instruments of given kind and currency."
      },
      "user.portfolio.{currency}": {
        "parameters": [
          {
            "$ref": "#/x-components/parameters/currency"
          }
        ],
        "tags": [
          "private"
        ],
        "description": "Provides information about current user portfolio",
        "notifications": {
          "examples": {
            "repeatedObject": {
              "externalValue": "examples/notifications/user.portfolio.currency.repeated.json"
            }
          },
          "schema": {
            "$ref": "#/definitions/user_portfolio_notification"
          }
        }
      },
      "user.trades.{instrument_name}.{interval}": {
        "parameters": [
          {
            "$ref": "#/x-components/parameters/instrument_name"
          },
          {
            "$ref": "#/x-components/parameters/subscription_interval"
          }
        ],
        "tags": [
          "private"
        ],
        "notifications": {
          "examples": {
            "repeatedObject": {
              "externalValue": "examples/notifications/user.trades.instrument_name.interval.repeated.json"
            }
          },
          "schema": {
            "$ref": "#/definitions/user_trade"
          }
        },
        "summary": "Get notifications about user's trades in an instrument."
      },
      "user.trades.{kind}.{currency}.{interval}": {
        "parameters": [
          {
            "$ref": "#/x-components/parameters/kind_with_any"
          },
          {
            "$ref": "#/x-components/parameters/currency_with_any"
          },
          {
            "$ref": "#/x-components/parameters/subscription_interval"
          }
        ],
        "tags": [
          "private"
        ],
        "notifications": {
          "examples": {
            "repeatedObject": {
              "externalValue": "examples/notifications/user.trades.kind.currency.interval.repeated.json"
            }
          },
          "schema": {
            "$ref": "#/definitions/user_trade"
          }
        },
        "summary": "Get notifications about user's trades in any instrument of given kind in given currency."
      }
    }
  }
}

methods = data[:paths].keys

methods.map! do |e|
  params = data[:paths][e].values.first[:parameters].map { |e| e[:name] }
  { path: e.to_s, params: params  }
end

binding.pry()