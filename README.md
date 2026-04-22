# Hello World Console Assignment (C# / .NET)

这个仓库是一个可直接提交的作业模板，满足以下要求：

- Hello World 控制台程序
- EditorConfig
- 代码格式检查：`dotnet format`
- 静态分析：.NET analyzers + `StyleCop.Analyzers`
- XML 文档注释
- 文档站点生成：DocFX
- 构建脚本：PowerShell 与 Bash
- CI/CD：GitHub Actions
- 至少 1 个单元测试：xUnit

---

## 1. 你需要先安装什么

- .NET SDK 8
- Git
- 一个编辑器（Visual Studio / VS Code / Rider 都可以）

---

## 2. 本地运行项目

### Windows PowerShell

```powershell
./scripts/build.ps1
```

### macOS / Linux / Git Bash

```bash
./scripts/build.sh
```

该脚本会自动完成：

1. Restore
2. 格式检查
3. Debug 编译
4. Release 编译
5. 运行单元测试
6. 安装 DocFX（如果本机没有）
7. 生成文档站点

---

## 3. 直接运行程序

```bash
dotnet run --project src/HelloWorld.Console/HelloWorld.Console.csproj
```

输出应为：

```text
Hello, World!
```

---

## 4. 推送到 GitHub

先在 GitHub 上新建一个空仓库，然后在项目根目录执行：

```bash
git init
git add .
git commit -m "Initial assignment submission"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git push -u origin main
```

---

## 5. 启用 GitHub Actions

推送后，GitHub 会自动运行 `.github/workflows/ci.yml`：

- 运行构建脚本
- 检查格式
- Debug/Release 编译
- 运行分析器
- 运行单元测试
- 生成文档
- 上传文档产物
- 自动部署文档到 GitHub Pages

---

## 6. 启用 GitHub Pages

在 GitHub 仓库中：

1. 打开 **Settings**
2. 打开 **Pages**
3. 在 **Build and deployment** 中选择 **GitHub Actions**

第一次 workflow 成功后，文档站点就会发布成功。

---

## 7. 作业检查表

- [x] Hello World 控制台应用
- [x] EditorConfig
- [x] 代码格式检查工具
- [x] 静态分析器
- [x] 公共类/方法 XML 文档注释
- [x] 文档生成站点
- [x] Bash / PowerShell 构建脚本
- [x] GitHub Actions CI/CD
- [x] 至少一个单元测试

