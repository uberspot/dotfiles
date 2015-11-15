/************************************************
 * user.js
 * Partially from
 * https://github.com/pyllyukko/user.js
 * with several modifications for personal usage
 ************************************************/

/**
  * Update hardening                                                           *
  * Since FF never updates url's i about:config we ensure we get the latest    *
  * software, updates and ressources.                                          *
  ******************************************************************************/

user_pref("app.update.url",		"https://aus5.mozilla.org/update/3/%PRODUCT%/%VERSION%/%BUILD_ID%/%BUILD_TARGET%/%LOCALE%/%CHANNEL%/%OS_VERSION%/%DISTRIBUTION%/%DISTRIBUTION_VERSION%/update.xml");
user_pref("browser.trackingprotection.gethashURL",		"https://shavar.services.mozilla.com/gethash?client=SAFEBROWSING_ID&appver=%VERSION%&pver=2.2");
user_pref("browser.trackingprotection.updateURL",		"https://shavar.services.mozilla.com/downloads?client=SAFEBROWSING_ID&appver=%VERSION%&pver=2.2");
user_pref("media.gmp-manager.certs.1.commonName",		"aus5.mozilla.org");
user_pref("media.gmp-manager.certs.1.issuerName",		"CN=DigiCert SHA2 Secure Server CA,O=DigiCert Inc,C=US");
user_pref("media.gmp-manager.certs.2.commonName",		"aus5.mozilla.org");
user_pref("media.gmp-manager.certs.2.issuerName",		"CN=thawte SSL CA - G2,O="thawte, Inc.",C=US");
user_pref("media.gmp-manager.url",		"https://aus5.mozilla.org/update/3/GMP/%VERSION%/%BUILD_ID%/%BUILD_TARGET%/%LOCALE%/%CHANNEL%/%OS_VERSION%/%DISTRIBUTION%/%DISTRIBUTION_VERSION%/update.xml");
user_pref("privacy.trackingprotection.introURL",		"https://www.mozilla.org/%LOCALE%/firefox/%VERSION%/tracking-protection/start/");
user_pref("signon.recipes.path",		"chrome://passwordmgr/content/recipes.json");
user_pref("browser.safebrowsing.reportMalwareMistakeURL",		"https://%LOCALE%.malware-error.mozilla.com/?hl=%LOCALE%&url=");
user_pref("browser.safebrowsing.reportPhishMistakeURL",		"https://%LOCALE%.phish-error.mozilla.com/?hl=%LOCALE%&url=");
user_pref("browser.safebrowsing.reportPhishURL",		"https://%LOCALE%.phish-report.mozilla.com/?hl=%LOCALE%&url=");
user_pref("media.peerconnection.default_iceservers",		"[]");

// https://wiki.mozilla.org/Media/WebRTC/Privacy
user_pref("media-peerconnection.ice.default_address_only",		true);
// Prevent CSS History Leak
// https://blog.mozilla.org/security/2010/03/31/plugging-the-css-history-leak/
user_pref("layout.css.visited_links_enabled",		false);

/******************************************************************************/

// disable link prefetching
// http://kb.mozillazine.org/Network.prefetch-next
user_pref("network.prefetch-next",		false);

// disable Location-Aware Browsing
// http://www.mozilla.org/en-US/firefox/geolocation/
user_pref("geo.enabled",			false);

// https://wiki.mozilla.org/Platform/Features/Telemetry
// https://www.mozilla.org/en-US/legal/privacy/firefox.html#telemetry
// https://wiki.mozilla.org/Security/Reviews/Firefox6/ReviewNotes/telemetry
user_pref("toolkit.telemetry.enabled",			false);

// https://gecko.readthedocs.org/en/latest/toolkit/components/telemetry/telemetry/preferences.html
user_pref("toolkit.telemetry.unified",      false);

// https://wiki.mozilla.org/Telemetry/Experiments
user_pref("experiments.supported",		false);
user_pref("experiments.enabled",		false);

// always ask the user where to download
// https://developer.mozilla.org/en/Download_Manager_preferences
user_pref("browser.download.useDownloadDir",		false);

// https://wiki.mozilla.org/Security#Tracking_protection
// https://support.mozilla.org/en-US/kb/tracking-protection-firefox
// TODO: are these two the same?
user_pref("privacy.trackingprotection.enabled",		true);

// https://trac.torproject.org/projects/tor/wiki/doc/TorifyHOWTO/WebBrowsers
user_pref("network.proxy.socks_remote_dns",		true);

// http://kb.mozillazine.org/Network.proxy.type
// the default in Firefox for Linux is to use system proxy settings.
// We change it to direct connection
user_pref("network.proxy.type", 0);

// disable sending of the health report
// https://support.mozilla.org/en-US/kb/firefox-health-report-understand-your-browser-perf
user_pref("datareporting.healthreport.uploadEnabled",	false);

// disable collection of the data (the healthreport.sqlite* files)
user_pref("datareporting.healthreport.service.enabled", false);

// https://gecko.readthedocs.org/en/latest/toolkit/components/telemetry/telemetry/preferences.html
user_pref("datareporting.policy.dataSubmissionEnabled",     false);

// https://developer.mozilla.org/en-US/docs/Web/API/BatteryManager
user_pref("dom.battery.enabled",				false);
// https://wiki.mozilla.org/WebAPI/Security/WebTelephony
user_pref("dom.telephony.enabled",				false);
// https://developer.mozilla.org/en-US/docs/Web/API/navigator.sendBeacon
user_pref("beacon.enabled",					false);
// https://developer.mozilla.org/en-US/docs/Mozilla/Preferences/Preference_reference/dom.event.clipboardevents.enabled
user_pref("dom.event.clipboardevents.enabled",			false);
// Webpages will not be able to affect the right-click menu
//user_pref("dom.event.contextmenu.enabled",			false);

// Disable new tab tile ads & preload
// http://www.thewindowsclub.com/disable-remove-ad-tiles-from-firefox
// http://forums.mozillazine.org/viewtopic.php?p=13876331&sid=811f876b0a8869c2e5b81e059d72f264#p13876331
user_pref("browser.newtabpage.enhanced",			false);
user_pref("browser.newtab.preload",				false);
// https://wiki.mozilla.org/Tiles/Technical_Documentation#Ping
user_pref("browser.newtabpage.directory.ping",          "");

user_pref("accessibility.blockautorefresh",true); // Instead of refreshing a page automatically when <meta http-equiv="refresh"> is present (or Refresh HTTP headers),
// display a browser message indicating the refresh and allow the user to follow it manually. 

// disable pocket
user_pref("browser.pocket.api",""); // https://support.mozilla.org/en-US/kb/save-web-pages-later-pocket-firefox
user_pref("browser.pocket.enabled",false); // https://support.mozilla.org/en-US/kb/save-web-pages-later-pocket-firefox
user_pref("browser.pocket.enabledLocales",""); // https://support.mozilla.org/en-US/kb/save-web-pages-later-pocket-firefox
user_pref("browser.pocket.oAuthConsumerKey",""); // https://support.mozilla.org/en-US/kb/save-web-pages-later-pocket-firefox
user_pref("browser.pocket.site",""); // https://support.mozilla.org/en-US/kb/save-web-pages-later-pocket-firefox
user_pref("browser.pocket.useLocaleList",false); // https://support.mozilla.org/en-US/kb/save-web-pages-later-pocket-firefox

user_pref("browser.toolbarbuttons.introduced.pocket-button", false);

// http://kb.mozillazine.org/Browser.send_pings
user_pref("browser.send_pings",					false);

/* See: https://developer.mozilla.org/en-US/Firefox/Releases/40/Site_Compatibility#Security
Sub-resources HTTP-authentication:
   0 - don't allow sub-resources to open HTTP authentication credentials dialogs
   1 - allow sub-resources to open HTTP authentication credentials dialogs, but don't allow it for cross-origin sub-resources
   2 - allow the cross-origin authentication as well */
user_pref("network.auth.allow-subresource-auth", 2);

// http://kb.mozillazine.org/Network.dns.disablePrefetch
user_pref("network.dns.disablePrefetch",			true);
user_pref("network.dns.disablePrefetchFromHTTPS",       true);

// https://wiki.mozilla.org/Privacy/Reviews/Necko
user_pref("network.predictor.enabled",              false);
user_pref("network.allow-experiments",              false);

// https://wiki.mozilla.org/Security/Reviews/Firefox/NavigationTimingAPI
user_pref("dom.enable_performance",             false);
user_pref("media.webspeech.recognition.enable", false);

user_pref("media.video_stats.enabled",      false);

// Disable face detection by default
user_pref("camera.control.face_detection.enabled",    false);

// disable gamepad input
// http://www.w3.org/TR/gamepad/
user_pref("dom.gamepad.enabled",				false);

// disable virtual reality devices
// https://developer.mozilla.org/en-US/Firefox/Releases/36#Interfaces.2FAPIs.2FDOM
user_pref("dom.vr.enabled",					false);

// CIS Mozilla Firefox 24 ESR v1.0.0 - 3.7 Disable JAR from opening Unsafe File Types
// http://kb.mozillazine.org/Network.jar.open-unsafe-types
user_pref("network.jar.open-unsafe-types",			false);

// update add-ons automatically
// https://blog.mozilla.org/addons/how-to-turn-off-add-on-updates/
user_pref("extensions.update.enabled",				true);

// http://kb.mozillazine.org/Extensions.blocklist.enabled
user_pref("extensions.blocklist.enabled",			true);

/******************************************************************************
 * HTTP                                                                       *
 *                                                                            *
 ******************************************************************************/

// disallow NTLMv1
// https://bugzilla.mozilla.org/show_bug.cgi?id=828183
user_pref("network.negotiate-auth.allow-insecure-ntlm-v1",	false);

// CSP https://developer.mozilla.org/en-US/docs/Web/Security/CSP/Introducing_Content_Security_Policy
user_pref("security.csp.enable",				true);

// Subresource integrity
// https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity
// https://wiki.mozilla.org/Security/Subresource_Integrity
user_pref("security.sri.enable",		true);

// DNT HTTP header
// http://dnt.mozilla.org/
// https://en.wikipedia.org/wiki/Do_not_track_header
user_pref("privacy.donottrackheader.enabled",			true);

// http://kb.mozillazine.org/Network.http.sendRefererHeader#0
// https://bugzilla.mozilla.org/show_bug.cgi?id=822869
// Send a referer header with the target URI as the source
//user_pref("network.http.sendRefererHeader",	0);
//user_pref("network.http.referer.spoofSource", true);
// CIS Version 1.2.0 October 21st, 2011 2.4.3 Disable Referer from an SSL Website
user_pref("network.http.sendSecureXSiteReferrer",		false);

/******************************************************************************
 * caching                                                                    *
 ******************************************************************************/

user_pref("privacy.clearOnShutdown.downloads",		true);

// https://bugzil.la/238789#c19
user_pref("browser.helperApps.deleteTempFileOnExit",    true);

// https://support.mozilla.org/en-US/questions/973320
// https://developer.mozilla.org/en-US/docs/Mozilla/Preferences/Preference_reference/browser.pagethumbnails.capturing_disabled
user_pref("browser.pagethumbnails.capturing_disabled",		false);

// CIS Version 1.2.0 October 21st, 2011 2.5.5 Delete Download History
// Zero (0) is an indication that no download history is retained for the current profile.
user_pref("browser.download.manager.retention",		0);

// https://wiki.mozilla.org/SVGOpenTypeFonts
// the iSEC Partners Report recommends to disable this
user_pref("gfx.font_rendering.opentype_svg.enabled",       false);
user_pref("gfx.font_rendering.cleartype_params.pixel_structure", 1);
user_pref("gfx.font_rendering.cleartype_params.rendering_mode", 5);
user_pref("gfx.font_rendering.fallback.always_use_cmaps", true);

/******************************************************************************
 * UI related                                                                 *
 ******************************************************************************/

// https://wiki.mozilla.org/Privacy/Reviews/New_Tab
user_pref("browser.newtabpage.enabled",			false);

// CIS Version 1.2.0 October 21st, 2011 2.2.3 Enable Warning of Using Weak Encryption
user_pref("security.warn_entering_weak",		true);

// CIS Mozilla Firefox 24 ESR v1.0.0 - 3.6 Enable IDN Show Punycode
// http://kb.mozillazine.org/Network.IDN_show_punycode
user_pref("network.IDN_show_punycode",			true);

// http://kb.mozillazine.org/Signon.autofillForms
// https://www.torproject.org/projects/torbrowser/design/#identifier-linkability
user_pref("signon.autofillForms",			false);

// https://developer.mozilla.org/en/Preferences/Mozilla_preferences_for_uber-geeks
// see also CVE-2009-3555
user_pref("security.ssl.warn_missing_rfc5746",		1);

/******************************************************************************
 * TLS / HTTPS / OCSP related stuff                                           *
 ******************************************************************************/

// https://blog.mozilla.org/security/2012/11/01/preloading-hsts/
// https://wiki.mozilla.org/Privacy/Features/HSTS_Preload_List
user_pref("network.stricttransportsecurity.preloadlist",	true);

// CIS Version 1.2.0 October 21st, 2011 2.2.4 Enable Online Certificate Status Protocol
user_pref("security.OCSP.enabled",			1);

// https://blog.mozilla.org/security/2013/07/29/ocsp-stapling-in-firefox/
user_pref("security.ssl.enable_ocsp_stapling",		true);

// require certificate revocation check through OCSP protocol.
// NOTICE: this leaks information about the sites you visit to the CA.
user_pref("security.OCSP.require",			false);

// https://www.blackhat.com/us-13/briefings.html#NextGen
user_pref("security.enable_tls_session_tickets",	false);

// TLS 1.[012]
// http://kb.mozillazine.org/Security.tls.version.max
// 1 = TLS 1.0 is the minimum required / maximum supported encryption protocol. (This is the current default for the maximum supported version.)
// 2 = TLS 1.1 is the minimum required / maximum supported encryption protocol.
user_pref("security.tls.version.min",			1);
user_pref("security.tls.version.max",			3);

// https://developer.mozilla.org/en-US/Firefox/Releases/38#Security
// https://bugzil.la/1138882
// https://rc4.io/
user_pref("security.tls.unrestricted_rc4_fallback",    false);

// disable SSLv3 (CVE-2014-3566)
user_pref("security.enable_ssl3",			false);

// https://wiki.mozilla.org/Security:Renegotiation#security.ssl.treat_unsafe_negotiation_as_broken
// see also CVE-2009-3555
user_pref("security.ssl.treat_unsafe_negotiation_as_broken",	true);

/******************************************************************************
 * CIPHERS                                                                    *
 * you can debug the SSL handshake with tshark: tshark -t ad -n -i wlan0 -T text -V -R ssl.handshake
 ******************************************************************************/

// disable null ciphers
user_pref("security.ssl3.rsa_null_sha",		false);
user_pref("security.ssl3.rsa_null_md5",		false);
user_pref("security.ssl3.ecdhe_rsa_null_sha",	false);
user_pref("security.ssl3.ecdhe_ecdsa_null_sha",	false);
user_pref("security.ssl3.ecdh_rsa_null_sha",	false);
user_pref("security.ssl3.ecdh_ecdsa_null_sha",	false);

/* SEED
 * https://en.wikipedia.org/wiki/SEED
 */
user_pref("security.ssl3.rsa_seed_sha",		false);

// 40 bits...
user_pref("security.ssl3.rsa_rc4_40_md5",	false);
user_pref("security.ssl3.rsa_rc2_40_md5",	false);

// 56 bits
user_pref("security.ssl3.rsa_1024_rc4_56_sha",	false);

// rest with MD5
user_pref("security.ssl3.rsa_rc4_128_md5",	false);

// 128 bits
user_pref("security.ssl3.rsa_rc4_128_sha",		false);
//user_pref("security.ssl3.rsa_rc4_128_md5",		false);
user_pref("security.ssl3.rsa_camellia_128_sha",		false);
user_pref("security.ssl3.ecdhe_rsa_rc4_128_sha",	false);
user_pref("security.ssl3.ecdhe_rsa_aes_128_sha",	false);
user_pref("security.ssl3.ecdhe_ecdsa_rc4_128_sha",	false);
user_pref("security.ssl3.ecdhe_ecdsa_aes_128_sha",	false);
user_pref("security.ssl3.ecdh_rsa_rc4_128_sha",		false);
user_pref("security.ssl3.ecdh_rsa_aes_128_sha",		false);
user_pref("security.ssl3.ecdh_ecdsa_rc4_128_sha",	false);
user_pref("security.ssl3.ecdh_ecdsa_aes_128_sha",	false);
user_pref("security.ssl3.dhe_rsa_camellia_128_sha",	false);
user_pref("security.ssl3.dhe_rsa_aes_128_sha",		false);

/*
 * 3DES -> false because effective key size < 128
 *
 *   https://en.wikipedia.org/wiki/3des#Security
 *   http://en.citizendium.org/wiki/Meet-in-the-middle_attack
 *
 * see also: http://www-archive.mozilla.org/projects/security/pki/nss/ssl/fips-ssl-ciphersuites.html
 */
user_pref("security.ssl3.dhe_rsa_des_ede3_sha",		false);
user_pref("security.ssl3.ecdhe_ecdsa_des_ede3_sha",	false);
user_pref("security.ssl3.ecdhe_rsa_des_ede3_sha",	false);
user_pref("security.ssl3.rsa_des_ede3_sha",		false);
user_pref("security.ssl3.rsa_fips_des_ede3_sha",	false);


// ciphers with ECDH (without /e$/)
user_pref("security.ssl3.ecdh_rsa_des_ede3_sha",	false);
user_pref("security.ssl3.ecdh_rsa_aes_256_sha",		false);
user_pref("security.ssl3.ecdh_ecdsa_des_ede3_sha",	false);
user_pref("security.ssl3.ecdh_ecdsa_aes_256_sha",	false);

// 256 bits without PFS
user_pref("security.ssl3.rsa_camellia_256_sha",		false);
user_pref("security.ssl3.rsa_aes_256_sha",		false);


// ciphers with ECDHE and > 128bits
user_pref("security.ssl3.ecdhe_rsa_aes_256_sha",	true);
user_pref("security.ssl3.ecdhe_ecdsa_aes_256_sha",	true);

// GCM... yes please!
user_pref("security.ssl3.ecdhe_ecdsa_aes_128_gcm_sha256",	true);
user_pref("security.ssl3.ecdhe_rsa_aes_128_gcm_sha256",		true);

/* susceptible to the logjam attack – https://weakdh.org/  */
user_pref("security.ssl3.dhe_rsa_camellia_256_sha",	false);
user_pref("security.ssl3.dhe_rsa_aes_256_sha",	false);

// ciphers with DSA (max 1024 bits)
user_pref("security.ssl3.dhe_dss_aes_128_sha",		false);
user_pref("security.ssl3.dhe_dss_aes_256_sha",		false);
user_pref("security.ssl3.dhe_dss_camellia_128_sha",	false);
user_pref("security.ssl3.dhe_dss_camellia_256_sha",	false);
user_pref("security.ssl3.dhe_dss_des_ede3_sha",		false);

/* fallbacks */
user_pref("security.ssl3.rsa_aes_128_sha",		true);

/*
 * 2.3 Dynamic Content Settings
 */

// CIS 2.3.4 Block Reported Web Forgeries
// http://kb.mozillazine.org/Browser.safebrowsing.enabled
// http://kb.mozillazine.org/Safe_browsing
// "or submit URLs to a third party"
user_pref("browser.safebrowsing.enabled",		false);

// CIS 2.3.5 Block Reported Attack Sites
// http://kb.mozillazine.org/Browser.safebrowsing.malware.enabled
user_pref("browser.safebrowsing.malware.enabled",	false);

// CIS 2.3.6 Disable Displaying Javascript in History URLs
user_pref("browser.urlbar.filter.javascript",		true);

/*
 * 2.7 Advanced JavaScript Settings
 */

// CIS 2.7.4 Disable Scripting of Plugins by JavaScript
//user_pref("security.xpconnect.plugin.unrestricted",	false);

// CIS Mozilla Firefox 24 ESR v1.0.0 - 3.8 Set File URI Origin Policy
// http://kb.mozillazine.org/Security.fileuri.strict_origin_policy
user_pref("security.fileuri.strict_origin_policy",	true);

/* Custom */

user_pref("browser.geolocation.warning.infoURL", "");
user_pref("browser.newtab.url", "about:blank");
user_pref("browser.safebrowsing.downloads.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.enabled", false);
user_pref("browser.safebrowsing.updateURL", "");
user_pref("browser.search.countryCode", "US");
user_pref("browser.search.geoSpecificDefaults", false);
user_pref("browser.search.geoip.url", "");
user_pref("browser.send_pings.require_same_host", true);
user_pref("geo.wifi.uri", "");
user_pref("mousewheel.min_line_scroll_amount", 25);
user_pref("network.http.pipelining.aggressive", true);
user_pref("network.http.pipelining.max-optimistic-requests", 8);
user_pref("network.http.pipelining.ssl", true);
user_pref("network.http.proxy.pipelining", true);
user_pref("network.predictor.cleaned-up", true);
user_pref("network.warnOnAboutNetworking", false);
user_pref("nglayout.initialpaint.delay", 0);

user_pref("breakpad.reportURL", "");
user_pref("browser.bookmarks.restore_default_bookmarks", false);
user_pref("browser.cache.disk.capacity", 870400);
user_pref("browser.cache.disk.parent_directory", "/dev/shm/firefox-cache");
user_pref("browser.cache.disk.smart_size.enabled", false);
user_pref("browser.cache.disk.smart_size.first_run", false);
user_pref("browser.cache.disk.smart_size.use_old_max", false);
user_pref("browser.cache.disk.smart_size_cached_value", 358400);
user_pref("browser.cache.frecency_experiment", 4);
user_pref("browser.customizemode.tip0.shown", true);
user_pref("browser.download.importedFromSqlite", true);
user_pref("browser.download.manager.closeWhenDone", true);
user_pref("browser.download.panel.firstSessionCompleted", true);
user_pref("browser.download.panel.shown", true);
user_pref("browser.download.useDownloadDir", false);
user_pref("browser.selfsupport.url", "");
user_pref("browser.send_pings.require_same_host", true);
user_pref("browser.sessionstore.interval", 45000);
user_pref("browser.sessionstore.max_tabs_undo", 20);
user_pref("browser.tabs.animate", false);
user_pref("clipboard.autocopy", false);
user_pref("dom.w3c_touch_events.expose", false);
user_pref("general.autoScroll", true);
user_pref("general.warnOnAboutConfig", false);
user_pref("geo.wifi.logging.enabled", false);
user_pref("network.cookie.prefsMigrated", true);
user_pref("network.dns.disableIPv6", true);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dnsCacheEntries", 100);
user_pref("network.dnsCacheExpiration", 600);
user_pref("network.http.max-connections", 64);
user_pref("network.http.max-persistent-connections-per-server", 5);
user_pref("network.http.pipelining", true);
user_pref("network.http.pipelining.maxrequests", 8);

// https://support.mozilla.org/en-US/kb/certificate-pinning-reports
//
// we could also disable security.ssl.errorReporting.enabled, but I think it's
// good to leave the option to report potentially malicious sites if the user
// chooses to do so.
//
// you can test this at https://pinningtest.appspot.com/
user_pref("security.ssl.errorReporting.automatic",      false);

user_pref("app.support.baseURL", "");
user_pref("app.update.url", "");
user_pref("browser.aboutHomeSnippets.updateUrl", "");
user_pref("extensions.getAddons.get.url", "");
user_pref("extensions.getAddons.getWithPerformance.url", "");
user_pref("extensions.update.background.url", "");

// Opt-out of add-on metadata updates
user_pref("extensions.getAddons.cache.enabled",   false);

// disable sensor API
// https://wiki.mozilla.org/Sensor_API
user_pref("device.sensors.enabled",                false);

user_pref("browser.devedition.theme.enabled", true);
user_pref("devtools.theme". "light");
user_pref("browser.altClickSave", true);
user_pref("browser.urlbar.trimURLs", false);


// Protection against Javascript exploits to block eval() 
// See: https://hackademix.net/2011/09/29/script-surrogates-quick-reference/
noscript.surrogate.noeval.replacement,		window.eval = null;document.eval=null;
noscript.surrogate.noeval.sources,		@^http://[a-z]+[^/]+\.[a-z]+(?:/|$);
noscript.surrogate.noeval.exceptions;

