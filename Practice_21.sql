--Trigger 

DELIMETER //
create Trigger trg_log_order_cancel
after update on orders
for each row
begin
	if new.order_status = 'Cancelled'
	AND old.order_status <> 'Cancelled' then
		insert into order_cancellation
		(order_id, cancelled_on, reason)
		values
		(new.order_id, NOW(), 'Order cancelled by user')
	End If
END //

Delimeter ;