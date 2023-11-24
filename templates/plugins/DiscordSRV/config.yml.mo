# DiscordSRV設定
# 助けが必要？ Discord、https://discordsrv.com/discordに参加してください

# ここは変更しないでください
ConfigVersion: 1.26.2

# Bot token: 取得したトークンはここに設定してください。設定方法は、プラグインの導入手順を参照してください。
# このオプションを変更した後、サーバーを再起動する必要があります
BotToken: "{{MC_DISCORDSRV_BOT_TOKEN}}"

# ゲームからDiscordへのチャンネルリンク
# 構文は Channels: {"Minecraftからのゲーム内チャネル名": "Discordからの数値チャネルID", "Minecraftからの別のゲーム内チャネル名": "Discordからの別の数値チャネルID"}
#
# DiscordSRVのメッセージはすべて、そのタイプのメッセージのチャネルが定義されていない限り、最初のチャネルに送られます。
# 互換性のあるチャットプラグインを使用する場合、チャネル名はそのプラグインのものになります（チャットメッセージ用）
#  - TownyChatを使用している場合、デフォルトのチャネルは通常"global"ではなく"general"と呼ばれます
# プレーヤーのチャットメッセージの場合（チャットプラグインを使用していない場合）: global
# サーバーの開始/停止メッセージ用: status
# アチーブメント/アドバンスメッセージ: awards
# 死のメッセージ: deaths
# 参加メッセージの場合: join
# メッセージを残す場合: leave
# dynmapメッセージの場合:dynmap
# ウォッチドッグメッセージの場合: watchdog
# /discord broadcast 用の場合: broadcasts （コマンドで指定されていない場合）
# アカウントリンク: link
#
# チャンネルペアの最初の部分はDiscordチャンネル名ではありません！
# このオプションを適用するように変更した後、「/ discord reload」を実行します
Channels: {"global": "{{MC_DISCORDSRV_CHANNELS_GLOBAL}}"}

# コンソールチャンネルの数値のID(チャンネル名ではありません)。コンソールチャンネルを全て無効にするなら、空のままにしてください。
DiscordConsoleChannelId: "{{MC_DISCORDSRV_DISCORD_CONSOLE_CHANNEL_ID}}"

# /discordの使用時にプレーヤーに表示される招待リンク、およびリンクが強制されるときにリンクされていないプレーヤーに表示されるメッセージに表示される招待リンク
DiscordInviteLink: "https://discord.gg/changethisintheconfig.yml"

# デバッグ情報
# 問題を見つけようとしない限り、これらを有効にしないでください。
#
# 利用可能なデバッグカテゴリ:
# MINECRAFT_TO_DISCORD  - Minecraftからのメッセージ
# DISCORD_TO_MINECRAFT  - Discordからのメッセージ
# GROUP_SYNC            - グループの同期
# PRESENCE              - ボットのゲームステータスまたは存在
# VOICE                 - 音声モジュール（voice.ymlを参照）
# REQUIRE_LINK          - モジュールに参加するにはリンクが必要です（linking.ymlを参照）
# NICKNAME_SYNC         - ニックネームの同期
# ALERTS                - アラート (alerts.ymlを参照)
# WATCHDOG              - Server ウォッチドッグ
# BAN_SYNCHRONIZATION   - BAN同期
# LP_CONTEXTS           - LuckPermのコンテキスト
# ACCOUNT_LINKING       - Discord/Minecraftアカウントのリンク
#
# UNCATEGORIZED         - 上記のいずれにも該当しないもの
# ALL                   - 上記のすべてのカテゴリ（UNCATEGORIZEDを含む）
#
# JDA                   - JDAのデバッグメッセージ
# JDA_REST_ACTIONS      - JDAの残りのアクションのデバッグ用
# CALLSTACKS            - DiscordSRVデバッグ呼び出しのスタックトレースを表示します
#
# 例: "Debug: [GROUP_SYNC, PRESENCE]"
#
Debug: []

# Legacy option for transitioning to the new Debug option,
# setting this to anything above 0 is the same as setting Debug to [ALL]
DebugLevel: 0

# 実験
# これらの機能は完全に最適化されていません。 自己責任

# JDBC (MySQL/MariaDB)
Experiment_JdbcAccountLinkBackend: "jdbc:mysql://HOST:PORT/DATABASE?autoReconnect=true&useSSL=false"
Experiment_JdbcTablePrefix: "discordsrv"
Experiment_JdbcUsername: "username"
Experiment_JdbcPassword: "password"

# Webhook配信
Experiment_WebhookChatMessageDelivery: {{MC_DISCORDSRV_EXPERIMENT_WEBHOOK_CHAT_MESSAGE_DELIVERY}}
Experiment_WebhookChatMessageUsernameFormat: "%displayname%"
Experiment_WebhookChatMessageFormat: "%message%"
Experiment_WebhookChatMessageUsernameFromDiscord: false
Experiment_WebhookChatMessageAvatarFromDiscord: false
Experiment_WebhookChatMessageUsernameFilters: {}

# 埋め込みとWebhookの画像/アバターのURL形式
# オフラインサーバー用の代替埋め込みアバターURL:
# https://cravatar.eu/helmavatar/{username}/{size}.png#{texture}
AvatarUrl: https://crafatar.com/avatars/{uuid-nodashes}.png?size={size}&overlay#{texture}

# Reserializer
# MinecraftとDiscord間の書式設定（太字、斜体、下線）を変換する
Experiment_MCDiscordReserializer_ToDiscord: false
Experiment_MCDiscordReserializer_ToMinecraft: false
Experiment_MCDiscordReserializer_InBroadcast: false

# その他
CancelConsoleCommandIfLoggingFailed: true
ForcedLanguage: none
PrintGuildsAndChannels: true
ForceTLSv12: true
NoopHostnameVerifier: false
MaximumAttemptsForSystemDNSBeforeUsingFallbackDNS: 3
TimestampFormat: EEE, d. MMM yyyy HH:mm:ss z
DateFormat: yyyy-MM-dd
# https://docs.discordsrv.com/config/#Timezone
Timezone: default
# MinecraftMentionSound: Discordから言及されたときにMinecraftのプレイヤーに音を送るかどうか
MinecraftMentionSound: true

# プラグインフック
# これらのオプションを変更した後、サーバーを再起動する必要があります
#
# DisabledPluginHooks: 無効化されたプラグインフック（通常はプラグインの名前だけ.
# VentureChatBungee: VentureChatフックのBungeeCord機能を有効にします（メッセージはすべてのサーバーから受信され、少なくとも1人のプレーヤーがオンラインである必要があります）
# EnablePresenceInformation: enabled presence information, which is required for some of our PlaceholderAPI placeholders. Keep in mind this requires the "Presence Intent" from the Discord developer portal
# UseModernPaperChatEvent: only use this if you have a chat plugins that SPECIFICALLY utilizes Paper's "AsyncChatEvent"
DisabledPluginHooks: []
VentureChatBungee: false
EnablePresenceInformation: false
UseModernPaperChatEvent: false

# Game Information
# Sets the "Playing: ______" indicator for the bot.
# Can be a single, static value, or cycle through multiple different options
# You can preface the status with "playing", "watching", or "listening to" to set the activity type
# PlaceholderAPI placeholders are supported
#
# DiscordGameStatus: Text to display. Can be a single value e.g. "Minecraft", or multiple values e.g. ["Minecraft", "yourip.changeme.com"]
# DiscordOnlineStatus: Activity status to display. This must be one of the following: ONLINE, DND, IDLE or INVISIBLE
# StatusUpdateRateInMinutes: How frequently to cycle the status
DiscordGameStatus: ["Minecraft"]
DiscordOnlineStatus: ONLINE
StatusUpdateRateInMinutes: 2

# チャットチャンネル情報
# チャットチャンネルは、DiscordのテキストチャンネルとMinecraftのゲーム内チャットを紐づけたチャンネルです。
# DiscordのチャットとMinecraftのチャットを、相互に転送することができます。
#
# DiscordChatChannelDiscordToMinecraft: Discordのテキストチャンネルのメッセージをゲーム内チャットに送信するかどうか
# DiscordChatChannelMinecraftToDiscord: ゲーム内チャットのメッセージをDiscordのテキストチャンネルに送信するかどうか
# DiscordChatChannelTruncateLength: DiscordからMinecraftに送信されるメッセージの最大長
# DiscordChatChannelTranslateMentions: @Person for Minecraftのような言い回しをDiscordメッセージに翻訳するかどうか
# DiscordChatChannelAllowedMentions: Minecraft toDiscordメッセージで許可されている言及の種類。 デフォルト値にないタイプは、「role」、「here」、および「everyone」です。
# DiscordChatChannelEmojiBehavior: どのように絵文字をMinecraftに送信するかを指定します。"show"、"name"、"hide"のいずれかです。
# DiscordChatChannelEmoteBehavior: Minecraftへのエモートの送信方法。"name"または "hide"を指定できます。
# DiscordChatChannelPrefixRequiredToProcessMessage: チャットの頭に付けると、MinecraftからDiscordに送信されるようにすることができるプレフィックス（例: "!"）。
# DiscordChatChannelPrefixActsAsBlacklist: プレフィックスをブラックリストとして動作させるかどうか
# DiscordChatChannelRolesAllowedToUseColorCodesInChat: DiscordからMinecraftに送る時に、カラー/フォーマットコードを使用できるロールのリスト
# DiscordChatChannelBroadcastDiscordMessagesToConsole: Discordから送信されたメッセージをコンソールに出力するかどうか
# DiscordChatChannelBlockBots: ボットをDiscordからブロックする必要があるかどうか - > MCチャット
# DiscordChatChannelBlockWebhooks: Discord→MCチャットでボットをブロックするかどうか
# DiscordChatChannelRequireLinkedAccount: プレイヤーに自分のDiscordアカウントをMinecraftにリンクさせて、DiscordメッセージをMinecraftに送るように要求するかどうか
# DiscordChatChannelBlockedIds: メッセージをブロックする、Discordユーザー（あるいはBot）のIDリスト
# DiscordChatChannelBlockedRolesAsWhitelist: 次のリストをホワイトリスト（true）またはブラックリスト（false）として扱う場合
# DiscordChatChannelBlockedRolesIds: メッセージをブロックするDiscordのロールIDの一覧です。
# DiscordChatChannelRolesSelectionAsWhitelist:次のリストをホワイトリスト（true）またはブラックリスト（false）として扱う場合
# DiscordChatChannelRolesSelection:すべてのユーザーの役割から除外する必要がある役割のリスト
# DiscordChatChannelRoleAliases: ロールエイリアスのリスト（Minecraftメッセージで使用するロールの代替名）
#
DiscordChatChannelDiscordToMinecraft: true
DiscordChatChannelMinecraftToDiscord: true
DiscordChatChannelTruncateLength: 256
DiscordChatChannelTranslateMentions: true
DiscordChatChannelAllowedMentions: [user, channel, emote]
DiscordChatChannelEmojiBehavior: "name"
DiscordChatChannelEmoteBehavior: "name"
DiscordChatChannelPrefixRequiredToProcessMessage: ""
DiscordChatChannelPrefixActsAsBlacklist: false
DiscordChatChannelRolesAllowedToUseColorCodesInChat: ["Developer", "Owner", "Admin", "Moderator"]
DiscordChatChannelBroadcastDiscordMessagesToConsole: true
DiscordChatChannelRequireLinkedAccount: false
DiscordChatChannelBlockBots: false
DiscordChatChannelBlockWebhooks: true
DiscordChatChannelBlockedIds: ["000000000000000000", "000000000000000000", "000000000000000000"]
DiscordChatChannelBlockedRolesAsWhitelist: false
DiscordChatChannelBlockedRolesIds: ["000000000000000000", "000000000000000000", "000000000000000000"]
DiscordChatChannelRolesSelectionAsWhitelist: false
DiscordChatChannelRolesSelection: ["Don't show me!", "Misc role"]
DiscordChatChannelRoleAliases: {"Developer": "Dev"}

# コンソールチャンネル情報
# コンソールチャンネルは、DiscordのテキストチャンネルとMinecraftのサーバーコンソールを紐づけたチャンネルです。
# Discordのテキストチャンネルからコンソールにコマンドを送ったり、コンソールの出力内容をDiscordで見たりすることができます。
#
# messages.yml（タイムスタンプの削除を含む）でコンソールメッセージをカスタマイズすることができます。
#
# DiscordConsoleChannelLogRefreshRateInSeconds: コンソールの表示内容を送信する間隔（秒単位）
# DiscordConsoleChannelUsageLog:
#     %date%:   現在の日付
#              例: 2017-01-01
#    PlaceholderAPIプレースホルダーがサポートされています
# DiscordConsoleChannelBlacklistActsAsWhitelist: "DiscordConsoleChannelBlacklistedCommands"設定を、ブラックリストの代わりにホワイトリストとして動作させるかどうか
# DiscordConsoleChannelBlacklistedCommands: Discordのユーザーがコンソールにコマンドとして送信できないようにするブラックリスト
# DiscordConsoleChannelBlacklistedCommands: phrases wrapped in quotation marks that users should not be able to send as commands to the console
# DiscordConsoleChannelFilters: Discordに送信されるコンソール回線に適用される正規表現フィルター。結果が空の場合、メッセージはまったく送信されません。
# DiscordConsoleChannelLevels: アペンダーを介してコンソールチャネルに送信するログレベル
# DiscordConsoleChannelUseCodeBlocks: コンソールをコードブロックでラップして色付けする必要がある場合
# DiscordConsoleChannelBlockBots: ボットがコンソールチャンネルでコマンドを送信することを許可するかどうか
#
DiscordConsoleChannelLogRefreshRateInSeconds: 5
DiscordConsoleChannelUsageLog: "Console-%date%.log"
DiscordConsoleChannelBlacklistActsAsWhitelist: false
DiscordConsoleChannelBlacklistedCommands: ["?", "op", "deop", "execute"]
DiscordConsoleChannelFilters: {".*(?i)async chat thread.*": "", ".*There are \\d+ (?:of a max of|out of maximum) \\d+ players online.*": ""}
DiscordConsoleChannelLevels: [info, warn, error]
DiscordConsoleChannelUseCodeBlocks: true
DiscordConsoleChannelBlockBots: false

# チャットチャンネルコマンド実行コマンド
# 登録されたチャットチャンネルから、Prefixを付けてコマンドを書くと、コンソールコマンドを実行させることができます。
# 例えば、"!c kick Notch" のように発言すると、コンソールで "kick Notch" コマンドを実行することができます。
#
# DiscordChatChannelConsoleCommandEnabled: チャットチャネルからのコンソールコマンドを許可するかどうか
# DiscordChatChannelConsoleCommandNotifyErrors: 権限のないユーザーがコマンドを実行したときに、権限が無いことを通知するかどうか
# DiscordChatChannelConsoleCommandPrefix: コンソールコマンドに使用するPrefix。例: "!c tps"
# DiscordChatChannelConsoleCommandRolesAllowed: チャットチャネルからサーバーコマンドの実行を許可するロール
# DiscordChatChannelConsoleCommandWhitelist: DiscordChatChannelConsoleCommandPrefixで実行可能なコマンドのリスト
# DiscordChatChannelConsoleCommandWhitelistBypassRoles: Whitelistに関係なくコマンドを実行することを許可するロールのリスト
# DiscordChatChannelConsoleCommandWhitelistActsAsBlacklist: "DiscordChatChannelConsoleCommandWhitelist"設定を、ホワイトリストの代わりにブラックリストとして動作させるかどうか
# DiscordChatChannelConsoleCommandExpiration: 送信されたコマンド出力がボットによって自動的に削除されるまでの時間（秒）。有効期限を無効にするには0に設定します。
# DiscordChatChannelConsoleCommandExpirationDeleteRequest: コマンドを発行した人のメッセージを削除するかどうか
#
DiscordChatChannelConsoleCommandEnabled: true
DiscordChatChannelConsoleCommandNotifyErrors: true
DiscordChatChannelConsoleCommandPrefix: "!c"
DiscordChatChannelConsoleCommandRolesAllowed: ["Developer", "Owner"]
DiscordChatChannelConsoleCommandWhitelist: ["say", "lag", "tps"]
DiscordChatChannelConsoleCommandWhitelistBypassRoles: ["Owner", "Developer"]
DiscordChatChannelConsoleCommandWhitelistActsAsBlacklist: false
DiscordChatChannelConsoleCommandExpiration: 0
DiscordChatChannelConsoleCommandExpirationDeleteRequest: true

# チャットチャンネルプレイヤーリストコマンド
# playerlistコマンドの設定内容
#
# DiscordChatChannelListCommandEnabled: コマンドを有効にするかどうか
# DiscordChatChannelListCommandMessage: プレイヤーリストのコマンド
# DiscordChatChannelListCommandExpiration: 送信されたプレーヤーのリストメッセージがボットによって自動的に削除されるまでの時間（秒）。有効期限を無効にするには0に設定します。
# DiscordChatChannelListCommandExpirationDeleteRequest: プレイヤーリストを要求した人のメッセージを削除するかどうか
#
DiscordChatChannelListCommandEnabled: true
DiscordChatChannelListCommandMessage: "playerlist"
DiscordChatChannelListCommandExpiration: 10
DiscordChatChannelListCommandExpirationDeleteRequest: true

# チャットチャンネル ブラックリストのフレーズと正規表現
#
# DiscordChatChannelGameFilters: Discordに送信されるチャットメッセージに適用される正規表現フィルター。結果が空の場合、メッセージはまったく送信されません。
# DiscordChatChannelDiscordFilters: Minecraftに送信されるチャットメッセージに適用される正規表現フィルター。結果が空の場合、メッセージはまったく送信されません。
#
DiscordChatChannelGameFilters: {}
DiscordChatChannelDiscordFilters: {".*Online players \\(.*": "", ".*\\*\\*No online players\\*\\*.*": ""}

# チャンネルトピック設定
#
# ChannelTopicUpdaterChannelTopicsAtShutdownEnabled: サーバーのシャットダウン時にチャンネルのトピックを変更する必要があるかどうか
# ChannelTopicUpdaterRateInMinutes: チャンネルのトピックを自動的に更新する間隔（分）
#
ChannelTopicUpdaterChannelTopicsAtShutdownEnabled: true
ChannelTopicUpdaterRateInMinutes: 10

# チャンネルアップデータ
# この機能は、ゲーム内プレースホルダーに準拠するように指定されたチャネルの名前を変更します
# オプション:
#   ChannelId:変更するチャネルのID（必須）
#   Format:チャネルのフォーマット（必須）。利用可能なプレースホルダー:
#     %playercount%:    現在のプレーヤー数
#     %playermax%:      最大プレーヤー数
#     %date%:           現在の日付と時刻
#     %totalplayers%:   メインワールドに参加するプレーヤーの総数
#     %uptimemins%:     DiscordSRVが開始されてからの分数
#     %uptimehours%:    DiscordSRVが開始されてからの時間数
#     %motd%:           サーバーのmotd
#     %serverversion%:  Spigot-1.9などのサーバーバージョン
#     %freememory%:     JVMのメモリをMB単位で解放します
#     %usedmemory%:     JVMの使用済みメモリ（MB）
#     %totalmemory%:    JVMの合計メモリ（MB）
#     %maxmemory%:      JVMの最大メモリ（MB）
#     %freememorygb%:   GB単位のJVMのメモリを解放します
#     %usedmemorygb%:   GB単位のJVMの使用済みメモリ
#     %totalmemorygb%:  JVMの合計メモリ（GB）
#     %maxmemorygb%:    JVMの最大メモリ（GB）
#     %tps%:            サーバーの平均TPS
#     PlaceholderAPIプレースホルダーもサポートされています
#   ShutdownFormat:サーバーがシャットダウンしたときにチャネルがとるべきフォーマット。利用可能なプレースホルダー:
#     %time% または %date%:  現在の日付と時刻
#     %serverversion%:      サーバーバージョン
#     %totalplayers%:       メインワールドに参加するプレーヤーの総数
#     %timestamp%:          現在のunixタイムスタンプ
#   UpdateInterval:チャネル名を更新するまでの待機時間（分単位）（レート制限のため、最小値は10）
ChannelUpdater:
  - ChannelId: "0000000000000000"
    Format: "%playercount%プレイヤーオンライン"
    ShutdownFormat: "サーバーはオフラインです"
    UpdateInterval: 10
  - ChannelId: "0000000000000000"
    Format: "現在のTPS: %tps%"
    ShutdownFormat: "サーバーはオフラインです"
    UpdateInterval: 10

# Discord 定型文応答
# これらは、定型文を返信するための設定です。
# おそらく、デフォルトから変更するか、独自のものを追加するべきです。
#
# 書き方は、  {"トリガー": "応答", "トリガー": "応答", ...}
# 定型文の応答を必要としない場合は、{} に設定してください。
# PlaceholderAPIプレースホルダがサポートされています
#
DiscordCannedResponses: {"!ip": "yourserveripchange.me", "!site": "http://yoursiteurl.net"}

# Minecraft から Discord へのアカウントリンク
# これらは、MinecraftアカウントをDiscordアカウントにリンクする機能に関する設定オプションです
#
# MinecraftDiscordAccountLinkedConsoleCommands: アカウントがリンクされているときに実行するコマンド。使用可能なキーワードについては以下を参照してください。
# MinecraftDiscordAccountUnlinkedConsoleCommands: アカウントのリンクが解除されたときに実行されるコマンド。可能なプレースホルダについては以下を参照してください。
# %minecraftplayername%: Minecraftのプレイヤー名
#                         例: Notch
# %minecraftuuid%:       プレイヤーのUUID
#                         例: you know what a uuid looks like
# %discordid%:           リンクされたDiscordのアカウントID
#                         例: 12345678901234567890
# %discordname%:         リンクされたDiscordのアカウント名
#                         例: Notch
#
# MinecraftDiscordAccountLinkedRoleNameToAddUserTo: Discordユーザーがアカウントをリンクするときに追加するDiscordロール名またはID
# MinecraftDiscordAccountLinkedAllowRelinkBySendingANewCode: 新しいコードをボットに送信して新しいコードとのリンクを解除して再リンクすることを許可する
# MinecraftDiscordAccountLinkedUsePM: PMを使用してアカウントをリンクする
# MinecraftDiscordAccountLinkedMessageDeleteSeconds: テキストチャンネルでリンクをした際のメッセージを削除するまでの時間（秒）。削除しない場合は0に設定します。
#
MinecraftDiscordAccountLinkedConsoleCommands: ["", "", ""]
MinecraftDiscordAccountUnlinkedConsoleCommands: ["", "", ""]
MinecraftDiscordAccountLinkedRoleNameToAddUserTo: "Linked"
MinecraftDiscordAccountLinkedAllowRelinkBySendingANewCode: false
MinecraftDiscordAccountLinkedUsePM: true
MinecraftDiscordAccountLinkedMessageDeleteSeconds: 0

# Server ウォッチドッグ
#
# ウォッチドッグは、サーバがゲームチックを実行した最後の時間を常に監視します
# 最後のtick以降の時間が設定された間隔（秒）を超えると、Discordメッセージがトリガーされます
# サーバーが重くなっていることを通知するために使用してください
#
# ServerWatchdogEnabled: ウォッチドッグを有効にするかどうか
# ServerWatchdogTimeout: ウォッチドッグが動作するまでに経過する必要のある秒数（Spigotのクラッシュ検出では、60秒が使用されています）
#                        この設定の最小値は10秒です。
# ServerWatchdogMessageCount: ServerWatchdogMessageが送信される回数。
#
ServerWatchdogEnabled: true
ServerWatchdogTimeout: 60
ServerWatchdogMessageCount: 3
