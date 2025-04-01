## Банка monobank
	
<a href="https://send.monobank.ua/jar/6VmeFAs1zG" target="_blank"><img alt="Монобанка" border="0" src="/assets/images/donate/mono.jpg" width="400px" style="border-radius:10px !important"></a>
{: .text-center}
{: .notice--info}

## Paypal

<div class="donate-wrapper">
	<div class="donate-form">
	<form class="donate-form" action="https://www.paypal.com/donate" method="post" target="_blank">
		<input type="hidden" name="hosted_button_id" value="S5BLF972J8G92" />
		<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Donate with PayPal button" />
		<img alt="" border="0" src="https://www.paypal.com/en_UA/i/scr/pixel.gif" width="1" height="1" />
	</form>
		<img alt="PayPal" border="0" src="/assets/images/donate/paypal.png" />
	</div>
</div>
{: .text-center}
{: .notice--info}

## USDT TRC20
<div class="donate-wrapper">
<div>
  <img alt="USDT TRC20" border="0" src="/assets/images/donate/usdt.png" width="400px" /><br>
  <div class="copy-address" onclick="copyToClipboard('TNhAUg4RFbjeyeLN6HAJ93EVTtpprU9xug')">
    <code id="wallet-address">TNhAUg4RFbjeyeLN6HAJ93EVTtpprU9xug</code>
    <span class="copy-tooltip">Натисніть, щоб скопіювати</span>
  </div>
</div>
</div>
{: .text-center}
{: .notice--info}

## Помочь Украине из-за рубежа

<a href="https://supportukrainenow.org/" target="_blank"><img alt="Support Ukraine Now" border="0" src="/assets/images/donate/sun.png" width="400px" style="border-radius:10px !important"></a>
{: .text-center}
{: .notice--info}

<script>
function copyToClipboard(text) {
  navigator.clipboard.writeText(text).then(function() {
    // Зміна підказки на короткий час
    var tooltip = document.querySelector('.copy-tooltip');
    tooltip.innerHTML = 'Скопійовано!';
    setTimeout(function() {
      tooltip.innerHTML = 'Натисніть, щоб скопіювати';
    }, 2000);
  });
}
</script>

<style>
.copy-address {
  position: relative;
  cursor: pointer;
  padding: 8px;
  border-radius: 4px;
  background-color: #f5f5f5;
  display: inline-block;
  margin-top: 5px;
}

.copy-address:hover {
  background-color: #e0e0e0;
}

.copy-tooltip {
  display: block;
  font-size: 12px;
  color: #666;
  margin-top: 4px;
}

.donate-wrapper {
  height: 100%;
  margin: 0;
  display: flex;
  justify-content: center;
  align-items: center;
}

.donate-form {
  text-align: center;
  padding: 20px;
  background-color: white;
  border-radius: 10px;
}
</style>
