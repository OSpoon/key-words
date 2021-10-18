## VSCode 自动补全插件编写到发布
### 前言
通过编写代码片段来实现按自己要求自动补全的功能，在一些项目中总会总结出一些规范的关键字或常用的单词，避免重复造词又懒得记忆，我们通过插件来做提示也未尝不可，顺便熟悉一下VSCode插件的编写到发布的流程。
### 准备自动补全的配置文件：

1.  通过VSCode快捷键`Ctrl+Shift+P`,输入`User Snippets`来创建一份代码片段,在什么语言环境中支持可以自行选择。 
1.  内容请参照默认生成的注释来进行配置： 
```json
{
	"Key Word （get）": {
		"scope": "javascript,typescript",
		"prefix": "kw.get",
		"body": [
			"get$1",
			"$2"
		],
		"description": "获取"
	}
}
```


### 通过脚手架生成插件项目

1. 键入依赖安装命令：`npm i -g yo generator-code vsce`；
1. 键入创建插件命令：`yo code`命令后选择`New Code Snippets`；

![image.png](https://cdn.nlark.com/yuque/0/2021/png/2373519/1634525105567-0c1289fd-3fd6-4572-9b7f-3b4bd50138c9.png#clientId=ueadae60d-bf38-4&from=paste&height=444&id=ub50aa883&margin=%5Bobject%20Object%5D&name=image.png&originHeight=444&originWidth=469&originalType=binary&ratio=1&size=22668&status=done&style=none&taskId=u494769ed-bbbb-44e4-b8af-ebae9515ae9&width=469)

3. 将准备好的配置文件内容覆盖到`snippets`文件夹的文件中；
3. 完善`package.json`的内容为自己的信息；
3. 更新`README.md`文件（必须修改，按自己要求或者随便改）；
3. 键入打包命令：`vsce package`，生成后的文件可以分享安装。
### 准备发布插件的账号信息

1.  准备微软账号：[https://login.microsoftonline.com/](https://login.microsoftonline.com/) 

![image.png](https://cdn.nlark.com/yuque/0/2021/png/2373519/1634524507299-d1bd0d07-d6c9-44d9-9809-fa6ca61dfedd.png#clientId=ueadae60d-bf38-4&from=paste&height=460&id=uc8acd606&margin=%5Bobject%20Object%5D&name=image.png&originHeight=460&originWidth=556&originalType=binary&ratio=1&size=61948&status=done&style=none&taskId=u31de6535-cdf7-4a64-848f-d8983199347&width=556)

2.  创建组织：[https://aex.dev.azure.com/me?mkt=zh-CN](https://aex.dev.azure.com/me?mkt=zh-CN) 

![image.png](https://cdn.nlark.com/yuque/0/2021/png/2373519/1634524367431-1423e756-3ef8-454f-a841-3f01b7d41dfd.png#clientId=ueadae60d-bf38-4&from=paste&height=360&id=fSR2Y&margin=%5Bobject%20Object%5D&name=image.png&originHeight=360&originWidth=1250&originalType=binary&ratio=1&size=34063&status=done&style=none&taskId=ud235e05e-ab4d-42d2-9e47-fa27a13047e&width=1250)

3.  跳转到组织并创建Personal Access Tokens：
https://dev.azure.com/<组织名称>/ 

![image.png](https://cdn.nlark.com/yuque/0/2021/png/2373519/1634524389602-5a6d495f-1eed-4b9d-9180-420b9bb389da.png#clientId=ueadae60d-bf38-4&from=paste&height=463&id=u1babc24f&margin=%5Bobject%20Object%5D&name=image.png&originHeight=463&originWidth=1907&originalType=binary&ratio=1&size=43118&status=done&style=none&taskId=u02d5954f-b5b5-4884-91ce-84842760851&width=1907)

4.  创建publisher，原有的命令已不支持：[https://aka.ms/vscode-create-publisher](https://aka.ms/vscode-create-publisher) 

![image.png](https://cdn.nlark.com/yuque/0/2021/png/2373519/1634524324339-67804987-a50e-48a7-aad8-642ac7d00ba7.png#clientId=ueadae60d-bf38-4&from=paste&height=45&id=u6a00a4c3&margin=%5Bobject%20Object%5D&name=image.png&originHeight=45&originWidth=1096&originalType=binary&ratio=1&size=6646&status=done&style=none&taskId=uc94fd783-4799-4c3f-bd13-d58622a3cc2&width=1096)

5.  插件插件发布情况：[https://marketplace.visualstudio.com/](https://marketplace.visualstudio.com/) 

![image.png](https://cdn.nlark.com/yuque/0/2021/png/2373519/1634524278305-58365b21-ebb9-4543-a188-f25809ea3818.png#clientId=ueadae60d-bf38-4&from=paste&height=288&id=u3c6cf36f&margin=%5Bobject%20Object%5D&name=image.png&originHeight=288&originWidth=1225&originalType=binary&ratio=1&size=34754&status=done&style=none&taskId=u4e534ae7-87f6-4a10-b2c7-b9eb993d01e&width=1225)
一顿注册完还没搞定的联系我一下，谁知道我都整了啥。

6. 执行发布脚本
> 执行期间需要输入token进行登录验证

```sh
#!/usr/bin/env bash
echo '请进行登录相关操作：'
vsce login publisher-name # 登陆
vsce package # 打包
echo "-------publishing-------"
vsce publish # 发布
echo "发布结束"
exit
```
