trigger updateWebsite on Account (before Insert) {
    for (Account acc : Trigger.new)
    acc.Website = 'www.prateek.com';
}