{pkgs, ...}: let
  settings = {
    # "gfx.webrender.enabled" = true;
    # "gfx.webrender.all" = true;
    # "media.ffmpeg.vaapi.enabled" = true;
    "browser.toolbars.bookmarks.visibility" = "never";
    "browser.search.separatePrivateDefault" = false;
    "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
    "browser.newtabpage.activity-stream.feeds.topsites" = false;
    "browser.startup.page" = 3;
    # "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
  };
  # userChrome = ''
  #   #TabsToolbar
  #   {
  #       visibility: collapse;
  #   }
  #   #sidebar-header
  #   {
  #       display: none;
  #   }
  # '';
  policies = {
    DisableAppUpdate = true;
    DisableSystemAddonUpdate = true;
    DisableProfileImport = true;
    DisableFirefoxStudies = true;
    DisableTelemetry = true;
    DisableFeedbackCommands = true;
    DisablePocket = true;
    DisableDeveloperTools = false;
    FirefoxHome = {
      Search = true;
      TopSites = false;
      SponsoredTopSites = false;
      Highlights = false;
      Pocket = false;
      SponsoredPocket = false;
      Snippets = false;
      Locked = false;
    };
    FirefoxSuggest = {
      WebSuggestions = false;
      SponsoredSuggestions = false;
      ImproveSuggest = false;
    };
    NoDefaultBookmarks = true;
    OverrideFirstRunPage = "";
    WebsiteFilter = {
      Block = [
        "https://localhost/*"
      ];
      Exceptions = [
        "https://localhost/*"
      ];
    };
    Extensions = {
      Install = [
        "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi"
        "https://addons.mozilla.org/firefox/downloads/latest/sidebery/latest.xpi"
        "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi"
        # "https://addons.mozilla.org/firefox/downloads/latest/surfingkeys_ff/latest.xpi"
        # "https://addons.mozilla.org/firefox/downloads/latest/adaptive_tab_bar_colour/latest.xpi"
      ];
      Uninstall = [
        "google@search.mozilla.org"
        "bing@search.mozilla.org"
        "amazondotcom@search.mozilla.org"
        "ebay@search.mozilla.org"
        "wikipedia@search.mozilla.org"
      ];
    };
    ExtensionSettings = {
      "google@search.mozilla.org".installation_mode = "blocked";
      "bing@search.mozilla.org".installation_mode = "blocked";
      "amazondotcom@search.mozilla.org".installation_mode = "blocked";
      "ebay@search.mozilla.org".installation_mode = "blocked";
      "wikipedia@search.mozilla.org".installation_mode = "blocked";
    };
    SearchEngines = {
      PreventInstalls = false;
      Remove = [
        "Google"
        "Bing"
        "Amazon.com"
        "eBay"
        "Wikipedia"
      ];
      Default = "DuckDuckGo";
    };
  };
  profiles = [
    {
      name = "main";
      id = 0;
    }
    {
      name = "lemon";
      id = 1;
    }
    {
      name = "throw";
      id = 2;
    }
    {
      name = "savvy";
      id = 3;
    }
    {
      name = "red";
      id = 4;
    }
  ];
in {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-esr;
    inherit policies;
    profiles = builtins.listToAttrs (map (s: {
        name = s.name;
        value = with s; {
          inherit name id settings;
        };
      })
      profiles);
  };
}
