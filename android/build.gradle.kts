allprojects {
    repositories {
//        google()
//        mavenCentral()
        google()
        mavenCentral()
        maven { url=uri("https://maven.aliyun.com/repository/google") }
        maven { url=uri("https://maven.aliyun.com/repository/jcenter") }
        maven { url=uri("https://maven.aliyun.com/repository/central") }
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
