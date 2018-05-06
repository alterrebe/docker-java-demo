module alterrebe.test {
    // required by the app:
    requires jdk.httpserver;

    // required by Jolokia:
    requires java.logging;
    requires java.naming;

    requires transitive java.instrument;
    requires transitive java.management;
    requires transitive java.xml;

    exports alterrebe.test;
}
