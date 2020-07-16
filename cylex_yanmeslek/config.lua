Config              = {}
Config.MarkerType   = 1 -- Marker'ın işareti. Markerları kapatmak için -1 yapabilirsiniz. Marker listesi için: https://docs.fivem.net/game-references/markers/
Config.DrawDistance = 100.0 --Markerların ne kadar uzaktan gözükeceğini belirler
Config.ZoneSize     = {x = 3.0, y = 3.0, z = 2.0} -- Marker büyüklüğü
Config.MarkerColor  = {r = 153, g = 0, b = 204} --Marker rengi

Config.RequiredCopsMelon  = 0 --Toplarken, keserken, satarken gereken polis sayısı
Config.RequiredCopsSarap  = 0 --Toplarken, işlerken, satarken gereken polis sayısı

Config.TimeToFarmSarap     = 1  * 1000 -- Saniyede kaç tane üzüm toplansın?
Config.TimeToProcessSarap  = 1  * 1000 -- Saniyede kaç tane şarap işlensin?
Config.TimeToSellSarap     = 1  * 1000 -- Saniyede kaç tane şarap satılsın?

Config.TimeToFarmMelon     = 3  * 1000 -- Saniyede kaç tane karpuz toplansın?
Config.TimeToProcessMelon  = 3  * 1000 -- Saniyede kaç tane karpuz kessin?
Config.TimeToSellMelon     = 2  * 1000 -- Saniyede kaç tane karpuz satsın?


Config.Locale = 'en'

Config.Zones = {
	MelonField =		{x=-108.61, y=1909.93, z=195.96}, -- KARPUZ TOPLAMA YERİ
	MelonProcessing =	{x=661.3002929687, y=603.17236328125, z=128.05114746094}, -- KARPUZ KESME YERİ
	MelonDealer =		{x=586.87884521484, y=607.7119140625, z=127.91110229492}, -- KARPUZ SATMA YERİ
	SarapField =		{x=1917.2606201172, y=4809.6313476563, z=43.611713409424}, -- ŞARAP TOPLAMA YERİ
	SarapProcessing =	{x=2016.4362792969, y=4987.23046875, z=41.098289489746}, -- ŞARAP İŞLEME YERİ
	SarapDealer =		{x=1536.0843505859, y=1702.4591064453, z=108.68807983398}, -- ŞARAP SATMA YERİ
}

Config.DisableBlip = false --Blipsleri kapatmak istiyorsanız true yapın. Açılmasını 
Config.Map = {

  {name="Karpuz Toplama",    color=2, scale=0.8, id=434, x=-108.61, y=1909.93, z=195.96}, -- Karpuz toplama noktası
  {name="Karpuz İşleme",       color=2, scale=0.8, id=434, x=661.3002929687, y=603.17236328125, z=128.05114746094}, -- Karpuz kesme noktası
  {name="Karpuz Satış",            color=2, scale=0.8, id=434, x=586.87884521484, y=607.7119140625, z=127.91110229492}, -- Karpuz satma noktası
  {name="Üzüm Toplama",    color=27, scale=0.8, id=499, x=1917.2606201172, y=4809.6313476563, z=43.611713409424}, -- Üzüm toplama noktası
  {name="Üzüm İşleme",       color=27, scale=0.8, id=499, x=2016.4362792969, y=4987.23046875, z=41.098289489746}, -- Şarap işleme noktası
  {name="Üzüm Satış",            color=27, scale=0.8, id=499, x=1536.0843505859, y=1702.4591064453, z=108.68807983398}-- Şarap satma noktası

}
