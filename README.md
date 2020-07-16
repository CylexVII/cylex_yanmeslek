# cylex_yanmeslek

Haritada belirtilen yerden karpuz,üzüm toplayıp kesip yada işleyip ufak gelir elde etmek için yapılmıştır.

İşlemleri yapmak için herhangi bir mesleğe girmenize gerek yok.
Her meslekte yapılabilir.

Şarap ve karpuz toplarken, işlerken ve satarken polis gereksin diyorsanız:
cylex_yanmeslek/config.lua'dan
Config.RequiredCopsSarap = 0
Config.RequiredCopsMelon = 0
0 yerine işlemi yaparken gereken polis sayısını yazabilirsiniz.

Satma fiyatlarını ayarlamak için:
Şarap kara para veriyor ve polis sayısına göre parası artıyor.
Şarap fiyatları için 159,162,165,168,171,174,177,180,183,186,189 satırlarını aşağıdaki gibi değiştirmeniz gerekiyor.
xPlayer.addAccountMoney('black_money', fiyat)

Karpuz normal para veriyor. Parasını değiştirmek 334. satırı aşağıdaki gibi değiştirmeniz gerekiyor
xPlayer.addMoney(para)


İsterseniz tüm dosyalarda isimleri değiştirerek eşyaları değiştirebilirsiniz.
Örneğin "karpuz" yerine "portakal" yapabilirsiniz.

                                             Kurulum:
İndirdiğiniz rarın içindeki cylex_yanmeslek dosyasını resources klasörünün içine atın.
server.cfg veya common.cfg içine start cylex_yanmeslek ekleyin.
