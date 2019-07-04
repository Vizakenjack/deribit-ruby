module Deribit
  REST_METHODS = {
   add_to_address_book: { prefix: 'private', params: ['currency', 'type', 'address', 'name', 'tfa'] },
   buy: { prefix: 'private', params: ['instrument_name', 'amount', 'type', 'label', 'price', 'time_in_force', 'max_show', 'post_only', 'reduce_only', 'stop_price', 'trigger', 'advanced'] },
   cancel: { prefix: 'private', params: ['order_id'] },
   cancel_all: { prefix: 'private', params: [] },
   cancel_all_by_currency: { prefix: 'private', params: ['currency', 'kind', 'type'] },
   cancel_all_by_instrument: { prefix: 'private', params: ['instrument_name', 'type'] },
   cancel_transfer_by_id: { prefix: 'private', params: ['currency', 'id', 'tfa'] },
   cancel_withdrawal: { prefix: 'private', params: ['currency', 'id'] },
   change_subaccount_name: { prefix: 'private', params: ['sid', 'name'] },
   close_position: { prefix: 'private', params: ['instrument_name', 'type', 'price'] },
   create_deposit_address: { prefix: 'private', params: ['currency'] },
   create_subaccount: { prefix: 'private', params: [] },
   disable_tfa_for_subaccount: { prefix: 'private', params: ['sid'] },
   edit: { prefix: 'private', params: ['order_id', 'amount', 'price', 'post_only', 'advanced', 'stop_price'] },
   get_account_summary: { prefix: 'private', params: ['currency', 'extended'] },
   get_address_book: { prefix: 'private', params: ['currency', 'type'] },
   get_current_deposit_address: { prefix: 'private', params: ['currency'] },
   get_deposits: { prefix: 'private', params: ['currency', 'count', 'offset'] },
   get_email_language: { prefix: 'private', params: [] },
   get_margins: { prefix: 'private', params: ['instrument_name', 'amount', 'price'] },
   get_new_announcements: { prefix: 'private', params: [] },
   get_open_orders_by_currency: { prefix: 'private', params: ['currency', 'kind', 'type'] },
   get_open_orders_by_instrument: { prefix: 'private', params: ['instrument_name', 'type'] },
   get_order_history_by_currency: { prefix: 'private', params: ['currency', 'kind', 'count', 'offset', 'include_old', 'include_unfilled'] },
   get_order_history_by_instrument: { prefix: 'private', params: ['instrument_name', 'count', 'offset', 'include_old', 'include_unfilled'] },
   get_order_margin_by_ids: { prefix: 'private', params: ['ids'] },
   get_order_state: { prefix: 'private', params: ['order_id'] },
   get_position: { prefix: 'private', params: ['instrument_name'] },
   get_positions: { prefix: 'private', params: ['currency', 'kind'] },
   get_settlement_history_by_currency: { prefix: 'private', params: ['currency', 'type', 'count'] },
   get_settlement_history_by_instrument: { prefix: 'private', params: ['instrument_name', 'type', 'count'] },
   get_subaccounts: { prefix: 'private', params: ['with_portfolio'] },
   get_transfers: { prefix: 'private', params: ['currency', 'count', 'offset'] },
   get_user_trades_by_currency: { prefix: 'private', params: ['currency', 'kind', 'start_id', 'end_id', 'count', 'include_old', 'sorting'] },
   get_user_trades_by_currency_and_time: { prefix: 'private', params: ['currency', 'kind', 'start_timestamp', 'end_timestamp', 'count', 'include_old', 'sorting'] },
   get_user_trades_by_instrument: { prefix: 'private', params: ['instrument_name', 'start_seq', 'end_seq', 'count', 'include_old', 'sorting'] },
   get_user_trades_by_instrument_and_time: { prefix: 'private', params: ['instrument_name', 'start_timestamp', 'end_timestamp', 'count', 'include_old', 'sorting'] },
   get_user_trades_by_order: { prefix: 'private', params: ['order_id', 'sorting'] },
   get_withdrawals: { prefix: 'private', params: ['currency', 'count', 'offset'] },
   getopenorders: { prefix: 'private', params: ['instrument', 'orderId', 'type'] },
   orderhistory: { prefix: 'private', params: ['count', 'instrument', 'offset'] },
   orderstate: { prefix: 'private', params: ['orderId'] },
   positions: { prefix: 'private', params: ['currency'] },
   remove_from_address_book: { prefix: 'private', params: ['currency', 'type', 'address', 'tfa'] },
   sell: { prefix: 'private', params: ['instrument_name', 'amount', 'type', 'label', 'price', 'time_in_force', 'max_show', 'post_only', 'reduce_only', 'stop_price', 'trigger', 'advanced'] },
   set_announcement_as_read: { prefix: 'private', params: ['announcement_id'] },
   set_email_for_subaccount: { prefix: 'private', params: ['sid', 'email'] },
   set_email_language: { prefix: 'private', params: ['language'] },
   set_password_for_subaccount: { prefix: 'private', params: ['sid', 'password'] },
   submit_transfer_to_subaccount: { prefix: 'private', params: ['currency', 'amount', 'destination'] },
   submit_transfer_to_user: { prefix: 'private', params: ['currency', 'amount', 'destination', 'tfa'] },
   toggle_deposit_address_creation: { prefix: 'private', params: ['currency', 'state'] },
   toggle_notifications_from_subaccount: { prefix: 'private', params: ['sid', 'state'] },
   toggle_subaccount_login: { prefix: 'private', params: ['sid', 'state'] },
   tradehistory: { prefix: 'private', params: ['sort', 'instrument', 'count', 'startId', 'endId', 'startSeq', 'endSeq', 'startTimestamp', 'endTimestamp', 'since', 'direction'] },
   withdraw: { prefix: 'private', params: ['currency', 'address', 'amount', 'priority', 'tfa'] },
   auth: { prefix: 'public',  params: ['grant_type', 'username', 'password', 'client_id', 'client_secret', 'refresh_token', 'timestamp', 'signature', 'nonce', 'state', 'scope'] },
   get_announcements: { prefix: 'public',  params: [] },
   get_book_summary_by_currency: { prefix: 'public',  params: ['currency', 'kind'] },
   get_book_summary_by_instrument: { prefix: 'public',  params: ['instrument_name'] },
   get_contract_size: { prefix: 'public',  params: ['instrument_name'] },
   get_currencies: { prefix: 'public',  params: [] },
   get_footer: { prefix: 'public',  params: [] },
   get_funding_chart_data: { prefix: 'public',  params: ['instrument_name', 'length'] },
   get_historical_volatility: { prefix: 'public',  params: ['currency'] },
   get_index: { prefix: 'public',  params: ['currency'] },
   get_instruments: { prefix: 'public',  params: ['currency', 'kind', 'expired'] },
   get_last_settlements_by_currency: { prefix: 'public',  params: ['currency', 'type', 'count', 'continuation', 'search_start_timestamp'] },
   get_last_settlements_by_instrument: { prefix: 'public',  params: ['instrument_name', 'type', 'count', 'continuation', 'search_start_timestamp'] },
   get_last_trades_by_currency: { prefix: 'public',  params: ['currency', 'kind', 'start_seq', 'end_seq', 'count', 'include_old', 'sorting'] },
   get_last_trades_by_currency_and_time: { prefix: 'public',  params: ['currency', 'kind', 'start_timestamp', 'end_timestamp', 'count', 'include_old', 'sorting'] },
   get_last_trades_by_instrument: { prefix: 'public',  params: ['instrument_name', 'start_seq', 'end_seq', 'count', 'include_old', 'sorting'] },
   get_last_trades_by_instrument_and_time: { prefix: 'public',  params: ['instrument_name', 'start_timestamp', 'end_timestamp', 'count', 'include_old', 'sorting'] },
   get_option_mark_prices: { prefix: 'public',  params: ['currency'] },
   get_order_book: { prefix: 'public',  params: ['instrument_name', 'depth'] },
   get_time: { prefix: 'public',  params: [] },
   get_trade_volumes: { prefix: 'public',  params: [] },
   getlasttrades: { prefix: 'public',  params: ['sort', 'instrument', 'count', 'startId', 'endId', 'startSeq', 'endSeq', 'startTimestamp', 'endTimestamp', 'since', 'direction'] },
   getorderbook: { prefix: 'public',  params: ['instrument', 'depth'] },
   ping: { prefix: 'public',  params: [] },
   test: { prefix: 'public',  params: ['expected_result'] },
   ticker: { prefix: 'public',  params: ['instrument_name'] },
   validate_field: { prefix: 'public',  params: ['field', 'value', 'value2']}
  }

  WS_METHODS = {
    enable_cancel_on_disconnect: { prefix: 'private', params: [] },
    disable_cancel_on_disconnect: { prefix: 'private', params: [] },
    logout: { prefix: 'private', params: [] },
    hello: { prefix: 'public',  params: ['client_name', 'client_version'] },
    set_heartbeat: { prefix: 'public',  params: ['interval'] },
    disable_heartbeat: { prefix: 'public',  params: [] },
    subscribe: { prefix: 'public',  params: ['channels'] },
    unsubscribe: { prefix: 'public',  params: ['channels']}
  }
end

