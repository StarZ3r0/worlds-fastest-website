<!doctype html>
<html lang="hu">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Worlds Fastest Website Experiment - avagy mi szükséges egy villámgyors weboldalhoz!?">
    <title>Worlds Fastest Website Experiment</title>
    {{ assets.outputCss('header') }}
</head>
<body>
<div id="layout" class="pure-g">
    <div class="sidebar pure-u-1 pure-u-md-1-4">
        <div class="header">
            <h1 class="brand-title">World Fastest Website</h1>
            <h2 class="brand-tagline">Hogyan készült blog</h2>
            <nav class="nav">
                <ul class="nav-list">
                    <li class="nav-item">
                        <a class="pure-button" href="http://starweb.hu/">StarWeb</a>
                    </li>
                    <li class="nav-item">
                        <a class="pure-button" href="http://tiborlakatos.name/">Lakatos Tibor</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <div class="content pure-u-1 pure-u-md-3-4">
        <div class="posts">
            <h1 class="content-subhead">Összes ráfordítás: 144 USD, Felhasznált idő: ~8 óra</h1>
            <section class="post">
                <header class="post-header">
                    <h2 class="post-title">Level 0: Domain név</h2>
                    <p class="post-meta">
                        Kategória: <span class="post-category post-category-general">Általános</span>
                    </p>
                </header>
                <div class="post-description">
                    <p>
                        Ha már nekifogunk a kísérletnek, akkor ne egy <code>.tk</code> domain köszönjön vissza, valami új tld-t szerettem volna, ha már úgyis tucatjával jelennek meg az újak. Így a <code>.website</code>-ra esett a választás, meg is kaptam a <a href="https://www.namecheap.com/">Namecheapnél</a> viszonylag olcsón. Önmagában a domain névnek nincs semmilyen jelentősége a sebesség terén, ezért itt könnyen megalkuvók lehetünk. 
                    </p>
                    <p>
                        <strong>Összes költség</strong>: $1.06 USD
                    </p>
                </div>
            </section> 
            <section class="post">
                <header class="post-header">
                    <h2 class="post-title">Level 1: DNS</h2>
                    <p class="post-meta">
                        Kategória: <span class="post-category post-category-infrastructure">Infrastruktúra</span>
                    </p>
                </header>
                <div class="post-description">
                    <p>
                        Szóval a névfeloldásnál kezdődik kicsiny oldalunk élete. Kivel is oldathatnánk fel domain nevünket, mint a leggyorsabb szolgáltatóval a világon a <a href="https://dnsmadeeasy.com/">DNSMadeEasy</a>-vel. Független mérések alapján pár éve már <a href="https://dnsmadeeasy.com/about/dns-speed/">ők a legjobbak</a> az iparágukban. Olyannyira profi a hálozatuk, hogy elbírja a napi 40 milliárd lekérdezést. 
                    </p>
                    <img src="{{ static_url("/img/speed-logo.png") }}" class="pure-img" alt="DNSMadeEasy speed logo" width="501" height="397">
                    <p>
                        <strong>Összes költség</strong>: 29.95 USD / év
                    </p>
                </div>
            </section>  
            <section class="post">
                <header class="post-header">
                    <h2 class="post-title">Level 2: VPS</h2>
                    <p class="post-meta">
                        Kategória: <span class="post-category post-category-infrastructure">Infrastruktúra</span>
                    </p>
                </header>
                <div class="post-description">
                    <p>
                        Szükség volt egy gyors VPS-re. Találtam is egyet Montrealban az <a href="https://www.ssdnodes.com/manage/aff.php?aff=324">SSD Nodes</a>-nál, az alábbi paraméretekkel:
                    </p>
                    <ul>
                        <li>4 magos processzor</li>
                        <li>8 GB RAM</li>
                        <li>40 GB SSD</li>
                        <li>4 TB forgalom</li>
                    </ul>
                    <p>A fentiek egy átlagos VPS-nek megfelelő paraméterek, de van két fontos dolog, ami viszont hozzájárul ahhoz, hogy kellően gyors legyen az oldalunk. Az egyik, hogy tényleg gyors lemezek legyenek a gépben, ha megnövekszik a forgalom, akkor ne pont a kicsi IOPS miatt pánikoljunk. Lássuk hogy alakult nálunk:</p>
<pre>
root@yass:~$ dd if=/dev/zero of=benchmark bs=64K count=32K conv=fdatasync
32768+0 records in
32768+0 records out
2147483648 bytes (2.1 GB, 2.0 GiB) copied, 2.41592 s, 889 MB/s
</pre>
                    <p>
                        A másik pedig, hogy földrajzilag lehetőleg minél közelebb legyen a szerverünk (ez esetünkben pont nem teljesül) vagy ha már nincs közel, akkor legalább minél nagyobb sávszélessége legyen, de nem csak országon belülre, hanem lehetőleg kívülre is. Nézzük az eredményeket <a href="https://github.com/sivel/speedtest-cli">speedtest-cli</a>-vel mérve:                        
                    </p>
<pre>
root@yass:~$ ./speedtest-cli
Retrieving speedtest.net configuration...
Testing from OVH (167.114.121.16)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by Fibrenoire Internet (Montreal, QC) [0.63 km]: 23.937 ms
Testing download speed...
Download: 905.22 Mbit/s
Testing upload speed...
Upload: 362.94 Mbit/s
</pre>
                    <p>
                        Nézzük meg akkor az óceán túloldalára:
                    </p>
<pre>
starz3r0@yass:~$ ./speedtest-cli --server 10389
Retrieving speedtest.net configuration...
Testing from OVH (167.114.121.16)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by Speedtest.net (Amsterdam) [5496.24 km]: 118.749 ms
Testing download speed...
Download: 187.59 Mbit/s
Testing upload speed...
Upload: 63.76 Mbit/s
</pre>
                    <p>Namost persze itt egy probléma felmerül, hogy minden requestre rájön egy jó 100 ms késleltetés. Ezt majd megpróbáljuk CDN-nel és az assetek számának minimalizálásával ellensúlyozni.</p>
                    <p>
                        <strong>Összes költség</strong>: 65.99 USD / év
                    </p>
                </div>
            </section> 
            <section class="post">
                <header class="post-header">
                    <h2 class="post-title">Level 3: NGINX</h2>
                    <p class="post-meta">
                        Kategória: <span class="post-category post-category-infrastructure">Infrastruktúra</span>
                    </p>
                </header>
                <div class="post-description">
                    <p>
                        Szükség volt egy stabil, erőforrás hatékony és jól terhelhető webszerverre, egyértelmű hogy az Nginxre esett a választás. A webszerverrel kapcsolatban két probléma merült fel
                    </p>
                    <ol>
                        <li>Az Ubuntu tárolóban csak az 1.10.0-ás verzió volt, ennél mindenképp újabbat szerettem volna, hogy ne egy elavult stackre építkezzünk.</li>
                        <li>A másik, hogy a <a href="https://developers.google.com/speed/pagespeed/module/">Google PageSpeed modul</a> nincs előre fordítva Nginxhez, amire viszont szükségünk lesz, hogy megfelelően optimalizált oldalt kapjunk.</li>
                    </ol>
                    <p>A fentiek fényében nem volt más választás, mint kézzel fordítani magamnak Nginxet. Talán ezzel ment el a legtöbb időm, de végül persze sikerült a legfrissebb verziót a legújabb PageSpeed modullal összeházasítani.</p>
                </div>
            </section>
            <section class="post">
                <header class="post-header">
                    <h2 class="post-title">Level 4: CDN</h2>
                    <p class="post-meta">
                        Kategória: <span class="post-category post-category-infrastructure">Infrastruktúra</span>
                    </p>
                </header>
                <div class="post-description">
                    <p>
                        Mint említettem már célszerű lenne, ha a képek letöltése földrajzilag a legközelebbi szerverről történne, így spórolnánk értékes ms-okat. Így ezeket egy egyszerű <code> static_url("/img/speed-logo.png")</code> hívással beállíthatjuk, hogy a CDN hivatkozása kerüljön a képeinket megjelenítő <code>img</code> tagbe.
                    </p>
                    <p>
                        <a href="/" class="keycdn-logo-svg">KeyCDN</a>
                    </p>
                    <p>
                        Szolgáltatónak a <a href="https://www.keycdn.com/">KeyCDN</a>-t választottam, mivel ár-érték arányban nagyon jó szolgáltatást nyújtanak. 
                    </p>
                    <p>
                        <strong>Összes költség</strong>: 49 USD / 1.2 TB forgalom
                    </p>
                </div>
            </section>
            <section class="post">
                <header class="post-header">
                    <h2 class="post-title">Level 5: PHP</h2>
                    <p class="post-meta">
                        Kategória: <span class="post-category post-category-code">Kód</span>
                    </p>
                </header>
                <div class="post-description">
                    <p>
                        Először úgy terveztem, hogy elég lesz az Ubuntu 16.04-ben lévő 7.0-ás PHP, de aztán ha már minden alkalmazásból a legújabb került fel, akkor - gondoltam - ezzel sem teszek kivételt. Teljesítményre abszolút nincs ennél jobb, így frameworkből sem lehetett akármit választani, hogy az eddig gondosan összelegózott komponenseket ne pont a végén rontsam el.
                    </p>
                    <p>Nos így került Phalcon 3.2 a stack utolsó helyére. Hivatalos támogatás is van rá, no meg mivel C kiterjesztésről van szó így a sebességére sem lehet panasz.</p>
                </div>
            </section>
            <section class="post">
                <header class="post-header">
                    <h2 class="post-title">Assetek optimalizálása</h2>
                    <p class="post-meta">
                        Kategória: <span class="post-category post-category-code">Kód</span>
                    </p>
                </header>
                <div class="post-description">
                    <p>
                       Itt több faktort is figyelembe kell venni. Az alábbi lépésekre volt szükség: 
                    </p>
                    <ul>
                        <li>Egyrészt ugye, célszerű a minél kevesebb asset vagy legalábbis minél kevesebb requestet elérni, ami alapvetőleg is jó, de a fentebb vázolt problémák miatt esetünkben különösen hasznosak. Hogy azért a karbantarthatóság megmaradjon külön kezeljük a 3 CSS fájlt, amiből kettő a <a href="https://purecss.io/">PureCSS</a> saját fáljja, a harmadik pedig a blogunk csinosítására használt állomány. Ezt a PageSpeed modul fűzi össze, majd mindjárt minifyolja is, ezzel tehát különösebb teendőnk nincs.</li>
                        <li>Az oldalon lévő képek optimalizlásása két eszközzel történk, az svg-ket az <a href="https://github.com/svg/svgo">SVGO</a>-val, minden egyéb képet pedig a <a href="https://kraken.io/">Kraken.io</a>-val optimalizáltam. Minden fájltípusnál jelentős méretcsökkenést (10-40%) lehet elérni az optimalizációval.</li>
                    </ul>
                </div>
            </section>
            <section class="post">
                <header class="post-header">
                    <h2 class="post-title">Tesztek</h2>
                    <p class="post-meta">
                        Kategória: <span class="post-category post-category-general">Általános</span>
                    </p>
                </header>
                <div class="post-description">
                    <p>
                        Az alábbi teszteket futtatam a szerveren:                        
                    </p>
                    <p>
                        Apache benchmark Nginx konfiguráció előtt:
                    </p>
<pre>
root@yass:~$ ab -k -n 10000 -c 50 -s 120 http://167.114.121.16/
This is ApacheBench, Version 2.3 

Server Software:        nginx/1.13.2
Server Hostname:        167.114.121.16
Server Port:            80

Document Path:          /
Document Length:        17 bytes

Concurrency Level:      50
Time taken for tests:   1.543 seconds
Complete requests:      10000
Failed requests:        0
Keep-Alive requests:    0
Total transferred:      1540000 bytes
HTML transferred:       170000 bytes
Requests per second:    6480.68 [#/sec] (mean)
Time per request:       7.715 [ms] (mean)
Time per request:       0.154 [ms] (mean, across all concurrent requests)
Transfer rate:          974.63 [Kbytes/sec] received
</pre>
                </div>
            </section>
            <section class="post">
                <header class="post-header">
                    <h2 class="post-title">Felhasznált szoftverek</h2>
                    <p class="post-meta">
                        Kategória: <span class="post-category post-category-general">Általános</span>
                    </p>
                </header>
                <div class="post-description">
                    <p>
                        Az oldalon az alábbi szoftverek alábbi verzióit használtam fel:
                    <p>
                    <ul>
                        <li>Szerver: Ubuntu Server 16.04.02</li>
                        <li>Webszerver: Nginx 1.13.2</li>
                        <li>Pagespeed modul: 1.12.34.2 stable</li>
                        <li>PHP: 7.1.6</li>
                        <li>Phalcon: 3.2.0</li>
                        <li>Pure CSS: 1.0.0</li>
                    </ul>
                    <p>Aki a részletekre is kiváncsi:</p>
<pre>
root@yass:~$ uname -a
Linux yass 4.4.0 #1 SMP Wed Jun 21 14:23:18 MSK 2017 x86_64 x86_64 x86_64 GNU/Linux

root@yass:~$ nginx -v
nginx version: nginx/1.13.2

root@yass:/etc/nginx/conf.d$ curl -I -X GET http://worlds-fastest.website/
X-Page-Speed: 1.12.34.2-0

root@yass:~$ php -v
PHP 7.1.6-1~ubuntu16.04.1+deb.sury.org+1 (cli) (built: Jun  9 2017 08:26:34) ( NTS )
Copyright (c) 1997-2017 The PHP Group
Zend Engine v3.1.0, Copyright (c) 1998-2017 Zend Technologies
    with Zend OPcache v7.1.6-1~ubuntu16.04.1+deb.sury.org+1, Copyright (c) 1999-2017, by Zend Technologies

root@yass:~$ php -r "echo Phalcon\Version::get();"
3.2.0
</pre>
                </div>
            </section> 
            <section class="post">
                <header class="post-header">
                    <h2 class="post-title">Eredmények</h2>
                    <p class="post-meta">
                        Kategória: <span class="post-category post-category-general">Általános</span>
                    </p>
                </header>
                <div class="post-description">
                    <p>
                        Az oldallal elért eredmények:
                    <p>
                    <ul>
                        <li><a href="https://developers.google.com/speed/pagespeed/insights/?url=http%3A%2F%2Fworlds-fastest.website%2F&tab=desktop">Google PageSpeed Insights</a>: mobil 100 pont, desktop 100 pont</li>
                        <li><a href="https://testmysite.thinkwithgoogle.com/">Google Mobile Website Speed Testing Tool</a>: 2s Loading time: Excellent (Low Est. Visitor loss)</li>
                        <li><a href="https://gtmetrix.com/reports/worlds-fastest.website/J2fHqFtk">GTmetrix</a>: PageSpeed Score 100% / YSlow Score 100%</li>
                        <li><a href="https://tools.pingdom.com/#!/cJ2YzR/http://worlds-fastest.website/">Pingdom</a>: 100 pont</li>
                        <li><a href="https://website.grader.com/results/worlds-fastest.website">Hubspot Website Grader</a>: 90 pont</li>
                        <li><a href="https://validator.w3.org/nu/?doc=http%3A%2F%2Fworlds-fastest.website%2F">The W3C Markup Validation Service</a>: 100% valid html</li>
                    </ul>
                </div>
            </section> 
            <section class="post">
                <header class="post-header">
                    <h2 class="post-title">Roadmap</h2>
                    <p class="post-meta">
                        Kategória: <span class="post-category post-category-general">Általános</span>
                    </p>
                </header>
                <div class="post-description">
                    <p>
                        A közeljövőben még további finomításokat, fejlesztéseket kívánok megcsinálni az oldalon, úgy mint
                    <p>
                    <ul>
                        <li>HTTPS beállítása a Let's Encrypt segítségével</li>
                        <li>Nginx konfig optimalizálása</li>
                        <li><a href="https://www.ampproject.org/">AMP</a> verzió létrehozása</li>
                    </ul>
                </div>
            </section> 
        </div>
        <div class="footer">
            <div class="pure-menu pure-menu-horizontal">
                <ul>
                    <li class="pure-menu-item"><a href="https://github.com/StarZ3r0" class="pure-menu-link">GitHub</a></li>
                    <li class="pure-menu-item"><a href="https://github.com/StarZ3r0/worlds-fastest-website" class="pure-menu-link">Forráskód</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>
