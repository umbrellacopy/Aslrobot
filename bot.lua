local function kmake(rows)
local kb = {}
kb.keyboard = rows
kb.resize_keyboard = true
kb.selective = true
return kb
end
local function kmakerow(texts)
local row = {}
for i=1 , #texts do
row[i] = {text=URL.escape(texts[i])}
end
return row
end
local function start_menu()
local rw1_texts = {'ثبت یا ویرایش اطلاعات'}
local rw2_texts = {'راهنمای استفاده','درباره ما'}
local rows ={kmakerow(rw1_texts),kmakerow(rw2_texts)}
return kmake(rows)
end
local function asl_menu()
local rw1_texts = {'منو اصلی','مشاهده مشخصات'}
local rw2_texts = {'نام','سن','محل سکونت'}
local rw3_texts = {'تحصیلات','شماره','وضعیت'}
local rw4_texts = {'کانال','اینستاگرام','سایت'}
local rows ={kmakerow(rw1_texts),kmakerow(rw2_texts),kmakerow(rw3_texts),kmakerow(rw4_texts)}
return kmake(rows)
end
local function back_menu()
local rw1_texts = {'انصراف'}
local rows ={kmakerow(rw1_texts)}
return kmake(rows)
end
local function bn_menu()
local rw1_texts = {'انصراف','ندارم'}
local rows ={kmakerow(rw1_texts)}
return kmake(rows)
end
local function age_menu()
local rw1_texts = {'انصراف','نشان نده'}
local rw2_texts = {'10','11','12','13','14'}
local rw3_texts = {'15','16','17','18','19'}
local rw4_texts = {'20','21','22','23','24'}
local rw5_texts = {'25','26','27','28','29'}
local rw6_texts = {'30','31','32','33','34'}
local rw7_texts = {'36','37','38','39','40'}
local rw8_texts = {'41','42','43','44','45'}
local rw9_texts = {'46','47','48','49','50'}
local rows ={kmakerow(rw1_texts),kmakerow(rw2_texts),kmakerow(rw3_texts),kmakerow(rw4_texts),kmakerow(rw5_texts),kmakerow(rw6_texts),kmakerow(rw7_texts),kmakerow(rw8_texts),kmakerow(rw9_texts)}
return kmake(rows)
end
local function loc_menu()
local rw1_texts = {'انصراف','نشان نده'}
local rw2_texts = {'تهران','البرز','کیش'}
local rw3_texts = {'آذر بایجان شرقی','آذزبایجان غربی','اردبیل'}
local rw4_texts = {'خراسان رضوی','خراسان جنوبی','خراسان شمالی'}
local rw5_texts = {'خوزستان','چهارمحال بختیاری','سیستان و بلوچستان'}
local rw6_texts = {'کرمان','کرمانشاه','کردستان'}
local rw7_texts = {'کهگیلویه و بویراحمد','گلستان','مرکزی'}
local rw8_texts = {'لرستان','مازندران','سمنان'}
local rw9_texts = {'زنجان','ایلام','قزوین','یزد'}
local rw10_texts = {'گیلان','بوشهر','فارس','قم'}
local rows ={kmakerow(rw1_texts),kmakerow(rw2_texts),kmakerow(rw3_texts),kmakerow(rw4_texts),kmakerow(rw5_texts),kmakerow(rw6_texts),kmakerow(rw7_texts),kmakerow(rw8_texts),kmakerow(rw9_texts),kmakerow(rw10_texts)}
return kmake(rows)
end
local function rabete_menu()
local rw1_texts = {'انصراف','نشان نده'}
local rw2_texts = {'مجرد','متاهل','مطلقه'}
local rw3_texts = {'نامزد','در رابطه','سینگل'}
local rows ={kmakerow(rw1_texts),kmakerow(rw2_texts),kmakerow(rw3_texts)}
return kmake(rows)
end
local function savad_menu()
local rw1_texts = {'انصراف','نشان نده'}
local rw2_texts = {'محصل','دانشجو','کنکوری'}
local rw3_texts = {'دیپلم','فوق دیپلم','لیسانس'}
local rw4_texts = {'فوق لیسانس','دکتر','ولگرد'}
local rows ={kmakerow(rw1_texts),kmakerow(rw2_texts),kmakerow(rw3_texts),kmakerow(rw4_texts)}
return kmake(rows)
end
local function action(msg)
if msg.text == '/start' then
db:hset('bot:waiting',msg.chat.id,'main')
local start = [[
روش استفاده از ربات:
`برای استفاد از این ربات 2 مرحله وجود دارد، مرحله ی اول ثبت مشخصات است و مرحله ی دوم فراخوانی اطلاعات در محل مورد نظر. وارد کردن تمامی اطلاعات به جز نام اختیاریست ولی نام را حتما باید ثبت نمایید. فراخوانی اطلاعات شما در هر مکان از طریق سرویس اینلاین ممکن است، مثلا در چت خصوصی یا گروه ها میتوانید مشخصات خود را ارسال کنید. اطلاعات شما اعم از نام، سن، محل سکونت، تحصیلات و وضعیت رابطه ی شما به صورت متنی ارسال میشود، وبسایت، اینستاگرام و کانال شما هم به صورت کیبرد شیشه ای. با ثبت شماره تلفن خود هم میتوانید کلیدی مربوط به ارسال کانتکت خود ایجاد کنید...`

روش استفاده از قابلیت اینلاین:
`فقط کافیست یوزرنیم ربات یعنی @uc_ASLrobot را تایپ کنید و بعد از آن یک فاصله اضافه کنید و منتظر بمانید تا کلیدهای ربات ظاهر شود. با انتخاب هر کلید میتوانید از آن استفاده کنید. همانطور که گفته شد از این قابلیت میتوانید در چت های خصوصی، گروه ها و حتی کانال بهره ببرید.`
]]
api.sendMessage(msg.chat.id, start, true,msg.message_id, true,start_menu())
return
elseif msg.text == '/init' and msg.chat.id == bot_sudo then
bot_init(true)
api.sendReply(msg, '*Reloaded!*', true)
return
elseif msg.text == 'راهنمای استفاده' then
local help = [[
روش استفاده از ربات:
`برای استفاد از این ربات 2 مرحله وجود دارد، مرحله ی اول ثبت مشخصات است و مرحله ی دوم فراخوانی اطلاعات در محل مورد نظر. وارد کردن تمامی اطلاعات به جز نام اختیاریست ولی نام را حتما باید ثبت نمایید. فراخوانی اطلاعات شما در هر مکان از طریق سرویس اینلاین ممکن است، مثلا در چت خصوصی یا گروه ها میتوانید مشخصات خود را ارسال کنید. اطلاعات شما اعم از نام، سن، محل سکونت، تحصیلات و وضعیت رابطه ی شما به صورت متنی ارسال میشود، وبسایت، اینستاگرام و کانال شما هم به صورت کیبرد شیشه ای. با ثبت شماره تلفن خود هم میتوانید کلیدی مربوط به ارسال کانتکت خود ایجاد کنید...`

روش استفاده از قابلیت اینلاین:
`فقط کافیست یوزرنیم ربات یعنی @uc_ASLrobot را تایپ کنید و بعد از آن یک فاصله اضافه کنید و منتظر بمانید تا کلیدهای ربات ظاهر شود. با انتخاب هر کلید میتوانید از آن استفاده کنید. همانطور که گفته شد از این قابلیت میتوانید در چت های خصوصی، گروه ها و حتی کانال بهره ببرید.`
]]
api.sendMessage(msg.chat.id, help, true,msg.message_id, true,start_menu())
return
elseif msg.text == 'درباره ما' then
local pms = [[
*ASL Robot* _v1.0_

`ربات اشتراگ گذاری مشخصات محصولی از` [تیم آمبرلا کپی](https://telegram.me/umbrellacopy)
]]
local keyboard = {}
    keyboard.inline_keyboard = {
{
{text = "Channel" , url = 'https://telegram.me/UmbrellaCopy'},
{text = "Source" , url = 'https://github.com/UmbrellaCopy/aslrobot'},
{text = "RoBoT" , url = 'https://telegram.me/uc_aslrobot'}
}
}
api.sendMessage(msg.chat.id, pms, true,msg.message_id, true,keyboard)
return
end
local setup = db:hget('bot:waiting',msg.chat.id)
if setup == 'main' then
if msg.text == 'ثبت یا ویرایش اطلاعات' then
local edit_asl = '`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`'
api.sendMessage(msg.chat.id, edit_asl, true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
end
elseif setup == 'editing' then
if msg.text == 'منو اصلی' then
api.sendMessage(msg.chat.id, '`منوی اصلی:`', true,msg.message_id, true,start_menu())
db:hset('bot:waiting',msg.chat.id,'main')
elseif msg.text == 'مشاهده مشخصات' then
if not db:hget('bot:name',msg.chat.id) then
api.sendMessage(msg.chat.id, '`حداقل نام باید ثبت گردد، فعلا مشخصاتی از شما ثبت نگردیده است.`',true)
return
end
local name = db:hget('bot:name',msg.chat.id)
local age = db:hget('bot:age',msg.chat.id)
local loc = db:hget('bot:loc',msg.chat.id)
local savad = db:hget('bot:savad',msg.chat.id)
local rabete = db:hget('bot:rabete',msg.chat.id)
local site = db:hget('bot:site',msg.chat.id)
local channel = db:hget('bot:channel',msg.chat.id)
local insta = db:hget('bot:instagram',msg.chat.id)
local text = name
if age then
text = text .. '\n'..age.. ' ساله'
end
if loc then
text = text .. '\nاز '..loc
end
if savad then
text = text .. '\n'..savad
end
if rabete then
text = text .. '\n'..rabete
end
local keyboard = {}
local inkb = {}
if site then
inkb[(#inkb + 1)] = {text='سایت',url='http://'..site}
end
if insta then
inkb[(#inkb + 1)] = {text='اینستا',url='http://instagram.com/'..insta}
end
if channel then
inkb[(#inkb + 1)] = {text='کانال',url='https://telegram.me/'..channel}
end
keyboard.inline_keyboard={inkb}
if channel or insta or site then
api.sendMessage(msg.chat.id,text..'\n.', true,nil, nil,keyboard)
else
api.sendMessage(msg.chat.id,text..'\n.')
end
elseif msg.text == 'نام' then
db:hset('bot:waiting',msg.chat.id,'membername')
api.sendMessage(msg.chat.id, 'نام خود را حداکثر تا 50 حرف وارد کنید:\nنام میتواند شامل حروف فارسی و حروف انگلیسی و ایموجی و ... باشد', true,msg.message_id, true,back_menu())
elseif msg.text == 'سن' then
db:hset('bot:waiting',msg.chat.id,'memberage')

api.sendMessage(msg.chat.id,'سن خود را وارد کنید:\nفقط بین 10 تا 50 سال مجاز است...', true,msg.message_id, true,age_menu())
elseif msg.text == 'وضعیت' then
db:hset('bot:waiting',msg.chat.id,'memberrabete')
api.sendMessage(msg.chat.id,'وضعیت رابطه خود را مشخص کنید:', true,msg.message_id, true,rabete_menu())
elseif msg.text == 'محل سکونت' then
db:hset('bot:waiting',msg.chat.id,'memberloc')
api.sendMessage(msg.chat.id,'محل سکونت خود را انتخاب کنید:\nاگر در لیست نبود میتوانید نام آن را تایپ و ارسال کنید...', true,msg.message_id, true,loc_menu())
elseif msg.text == 'تحصیلات' then
db:hset('bot:waiting',msg.chat.id,'membersavad')
api.sendMessage(msg.chat.id,'تحصیلات خود را وارد کنید:', true,msg.message_id, true,savad_menu())
elseif msg.text == 'سایت' then
db:hset('bot:waiting',msg.chat.id,'membersite')
api.sendMessage(msg.chat.id,'وبسایت یا وبلاگ خود را وارد کنید:\nبدونه http:// وارد کنید , مثال:\numbrellacopy.ir', true,msg.message_id, true,bn_menu())

elseif msg.text == 'کانال' then
db:hset('bot:waiting',msg.chat.id,'memberchannel')
api.sendMessage(msg.chat.id,'یوزرنیم کانال خود را وارد کنید:\nلینک قبول نیست, مثال:\n@umbrellacopy', true,msg.message_id, true,bn_menu())

elseif msg.text == 'اینستاگرام' then
db:hset('bot:waiting',msg.chat.id,'memberinstagram')
api.sendMessage(msg.chat.id,'یوزرنیم اینستاگرام خود را وارد کنید:\nمثال:\numbrellacopy', true,msg.message_id, true,bn_menu())

elseif msg.text == 'شماره' then
db:hset('bot:waiting',msg.chat.id,'membernumber')
api.sendMessage(msg.chat.id,'شماره ایران خود را بدون 0 وارد کنید\nاین شماره در اطلاعات شما ارسال نمیشود و برای کلید کانکت شماست\nمثال: 9141234567', true,msg.message_id, true,bn_menu())
end
elseif setup == 'membername' then
if msg.text then
if msg.text == 'انصراف' then
local edit_asl = '`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`'
api.sendMessage(msg.chat.id, edit_asl, true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
return
end
api.sendMessage(msg.chat.id ,'اطلاعات ثبت شد.\n`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`', true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
db:hset('bot:name',msg.chat.id,msg.text)
end
elseif setup == 'memberage' then
if msg.text then
if msg.text == 'انصراف' then
local edit_asl = '`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`'
api.sendMessage(msg.chat.id, edit_asl, true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
return
end
if msg.text == 'نشان نده' then
api.sendMessage(msg.chat.id ,'اطلاعات ثبت شد.\n`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`', true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
db:hdel('bot:age',msg.chat.id)
return
end
if msg.text:match('^%d+$') and tonumber(msg.text) <= 50 and tonumber(msg.text) >= 10 then
api.sendMessage(msg.chat.id ,'اطلاعات ثبت شد.\n`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`', true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
db:hset('bot:age',msg.chat.id,msg.text)
else 
api.sendMessage(msg.chat.id,'`حداقل سن 10 و حداکثر 50 سال است..`',true)
end
end
elseif setup == 'memberloc' then
if msg.text then
if msg.text == 'انصراف' then
local edit_asl = '`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`'
api.sendMessage(msg.chat.id, edit_asl, true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
return
end
if msg.text == 'نشان نده' then
api.sendMessage(msg.chat.id ,'اطلاعات ثبت شد.\n`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`', true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
db:hdel('bot:loc',msg.chat.id)
return
end
api.sendMessage(msg.chat.id ,'اطلاعات ثبت شد.\n`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`', true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
db:hset('bot:loc',msg.chat.id,msg.text)
end
elseif setup == 'memberrabete' then
if msg.text then
if msg.text == 'انصراف' then
local edit_asl = '`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`'
api.sendMessage(msg.chat.id, edit_asl, true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
return
end
if msg.text == 'نشان نده' then
api.sendMessage(msg.chat.id ,'اطلاعات ثبت شد.\n`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`', true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
db:hdel('bot:rabete',msg.chat.id)
return
end
api.sendMessage(msg.chat.id ,'اطلاعات ثبت شد.\n`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`', true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
db:hset('bot:rabete',msg.chat.id,msg.text)
end
elseif setup == 'membersavad' then
if msg.text then
if msg.text == 'انصراف' then
local edit_asl = '`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`'
api.sendMessage(msg.chat.id, edit_asl, true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
return
end
if msg.text == 'نشان نده' then
api.sendMessage(msg.chat.id ,'اطلاعات ثبت شد.\n`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`', true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
db:hdel('bot:savad',msg.chat.id)
return
end
api.sendMessage(msg.chat.id ,'اطلاعات ثبت شد.\n`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`', true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
db:hset('bot:savad',msg.chat.id,msg.text)
end
elseif setup == 'memberchannel' then
if msg.text then
if msg.text == 'انصراف' then
local edit_asl = '`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`'
api.sendMessage(msg.chat.id, edit_asl, true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
return
end
if msg.text == 'ندارم' then
api.sendMessage(msg.chat.id ,'اطلاعات ثبت شد.\n`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`', true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
db:hdel('bot:channel',msg.chat.id)
return
end
local chusername = msg.text:match('^@([a-zA-Z0-9]+)$')
if chusername then
api.sendMessage(msg.chat.id ,'اطلاعات ثبت شد.\n`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`', true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
db:hset('bot:channel',msg.chat.id,chusername)
end
end
elseif setup == 'memberinstagram' then
if msg.text then
if msg.text == 'انصراف' then
local edit_asl = '`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`'
api.sendMessage(msg.chat.id, edit_asl, true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
return
end
if msg.text == 'ندارم' then
api.sendMessage(msg.chat.id ,'اطلاعات ثبت شد.\n`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`', true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
db:hdel('bot:instagram',msg.chat.id)
return
end
local chusername = msg.text:match('^([a-zA-Z0-9%._]+)$')
if chusername then
api.sendMessage(msg.chat.id ,'اطلاعات ثبت شد.\n`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`', true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
db:hset('bot:instagram',msg.chat.id,chusername)
end
end
elseif setup == 'membersite' then
if msg.text then
if msg.text == 'انصراف' then
local edit_asl = '`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`'
api.sendMessage(msg.chat.id, edit_asl, true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
return
end
if msg.text == 'ندارم' then
api.sendMessage(msg.chat.id ,'اطلاعات ثبت شد.\n`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`', true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
db:hdel('bot:site',msg.chat.id)
return
end
local chusername = msg.text:match('^https?://([%w-_%.%?%.:/%+=&]+)$')
if chusername then
api.sendMessage(msg.chat.id ,'اطلاعات ثبت شد.\n`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`', true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
db:hset('bot:site',msg.chat.id,chusername)
end
end
elseif setup == 'membernumber' then
if msg.text then
if msg.text == 'انصراف' then
local edit_asl = '`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`'
api.sendMessage(msg.chat.id, edit_asl, true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
return
end
if msg.text == 'ندارم' then
api.sendMessage(msg.chat.id ,'اطلاعات ثبت شد.\n`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`', true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
db:hdel('bot:number',msg.chat.id)
return
end
if msg.text:match('^[1-9][0-9]+$') and msg.text:len() == 10 then
local num = '+98'..msg.text
api.sendMessage(msg.chat.id ,'اطلاعات ثبت شد.\n`یکی از گزینه ها را جهت ثبت یا ویرایش اطلاعات وارد کنید:`', true,msg.message_id, true,asl_menu())
db:hset('bot:waiting',msg.chat.id,'editing')
db:hset('bot:number',msg.chat.id,num)
end
end
end
end

local function iaction(inline)
local qresult = {}
local name = db:hget('bot:name',inline.from.id)
if name then
local number = db:hget('bot:number',inline.from.id)
if number then
local result = {}
result.id = tostring(#qresult + 1)
 result.type = 'contact'
 result.thumb_url = URL.escape('http://apktools.ir/wp-content/uploads/2016/07/telegram-icon.png')
 result.first_name = URL.escape(name)
 result.phone_number = URL.escape(number)
  qresult[#qresult + 1] = result
end
local result = {}
result.id = tostring(#qresult + 1)
 result.type = 'article'
 result.thumb_url = URL.escape('http://opload.ir/im/6m95/bf945d3115d93.jpg')
 result.description = URL.escape('اینجا کلیک کنید تا مشخصات شما ارسال شود')
 result.title = URL.escape('ارسال مشخصات')
local age = db:hget('bot:age',inline.from.id)
local loc = db:hget('bot:loc',inline.from.id)
local savad = db:hget('bot:savad',inline.from.id)
local rabete = db:hget('bot:rabete',inline.from.id)
local site = db:hget('bot:site',inline.from.id)
local channel = db:hget('bot:channel',inline.from.id)
local insta = db:hget('bot:instagram',inline.from.id)
local text = name
if age then
text = text .. '\n'..age.. ' ساله'
end
if loc then
text = text .. '\nاز '..loc
end
if savad then
text = text .. '\n'..savad
end
if rabete then
text = text .. '\n'..rabete
end
local keyboard = {}
local inkb = {}
if site then
inkb[(#inkb + 1)] = {text=URL.escape('سایت'),url=URL.escape('http://'..site)}
end
if insta then
inkb[(#inkb + 1)] = {text=URL.escape('اینستا'),url=URL.escape('http://instagram.com/'..insta)}
end
if channel then
inkb[(#inkb + 1)] = {text=URL.escape('کانال'),url=URL.escape('https://telegram.me/'..channel)}
end
keyboard.inline_keyboard={inkb}
if channel or insta or site then
result.reply_markup = keyboard
end
 result.message_text = URL.escape(text..'\n⛱ @uc_ASLrobot')
 qresult[#qresult + 1] = result
api.sendInline(inline.id, qresult,0)
else
local result = {}
result.id = tostring(#qresult + 1)
 result.type = 'article'
 result.thumb_url = URL.escape('http://seemorgh.com/images/content/news/1394/02/0000000000000000000000000011errrrerW.jpg')
 result.description = URL.escape('شما اطلاعات خود را ثبت نکردید، به ربات مراجعه کنید و اقدام به ثبت اطلاعات خود نمایید')
 result.title = URL.escape('اطلاعات موجود نیست')
result.message_text = URL.escape('شما هنوز اطلاعات خود را ثبت نکردید، به ربات مراجعه کنید و اقدام به ثبت اطلاعات خود نمایید')
keyboard = {}
keyboard.inline_keyboard = {{{text=URL.escape('ثبت مشخصات در ربات'),url=URL.escape('https://telegram.me/uc_aslrobot')}}}
result.reply_markup = keyboard
 qresult[#qresult + 1] = result
api.sendInline(inline.id, qresult,0)
end
end


return {
action = action,
iaction = iaction
}