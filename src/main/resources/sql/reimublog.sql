/*
Navicat MySQL Data Transfer

Source Server         : 开发本地docker-192.168.126.129
Source Server Version : 80018
Source Host           : 192.168.126.129:3306
Source Database       : reimublog

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2019-11-16 15:42:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `article_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文章ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '文章内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('01720826cfe5a3b1265f898e3a9812cc', '1911TteflNXd', '<div class=\"markdown-body editormd-preview-container\" previewcontainer=\"true\" style=\"padding: 20px;\"><p>asdasdasdasdasdasddddd</p>\n</div>', '2019-11-16 13:36:36', '2019-11-16 13:36:36');
INSERT INTO `t_article` VALUES ('14a4fc0c023523ede5459750c725d657', '1911srXIM35e', '<p>vvvvvvvvv</p>\n', '2019-11-05 20:24:39', '2019-11-05 20:24:39');
INSERT INTO `t_article` VALUES ('892e946e4521612ffcca09f6229e6da5', '1911lG1TdjMz', '<p>aaaa</p>\n', '2019-11-05 12:21:53', '2019-11-05 12:21:53');
INSERT INTO `t_article` VALUES ('9678ee7dd8eee7fef524e380c06a8060', '1911x3mugPKI', '<div class=\"markdown-body editormd-preview-container\" previewcontainer=\"true\" style=\"padding: 20px;\"><p>[toc]</p>\n<h1 id=\"h1-u6458u8981\"><a name=\"摘要\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>摘要</h1><p>springboot项目构建<br>springboot启动控制台图案修改\n</p><h1 id=\"h1-springboot-\"><a name=\"springboot是什么\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>springboot是什么</h1><p>Spring Boot 是由 Pivotal 团队提供的全新框架，其设计目的是用来简化新 Spring 应用的初始搭建以及开发过程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。(百度百科)<br>简单来说，就是我们最初用过的ssm、ssh框架，在构建项目时需要繁杂的配置文件：<br>使用spring就要扫描包、异常拦截器、过滤器、事务等<br>使用myBatis/hibernate要有dataSource,sqlSessionFactory,MapperScan等bean配置<br>每引入一个框架，就需要一堆配置文件。<br>springboot可以看做是对我们要引入的框架做了默认的实现，引入后若没有特别要求，只需要少量必要的配置如（ip,端口），甚至是零配置就可以实现新框架的引入。\n</p><h1 id=\"h1--springboot\"><a name=\"为什么要学springboot\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>为什么要学springboot</h1><p>从上段已经能看书，springboot在构建项目时大大减少工作量。<br>其实，在编码和部署时springboot也大大减少了工作量<br>编程时大量使用注解式编程，简化了代码量，和编程复杂程度<br>部署时可打成可执行jar包，直接用java -jar命令启动  \n</p><p>自从用了springboot,腰不酸了，腿不疼了，一口气能上五楼了</p>\n<h1 id=\"h1--springboot-\"><a name=\"构建第一个springboot项目\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>构建第一个springboot项目</h1><p>夸了半天，不再废话，直接上手  </p>\n<h2 id=\"h2--idea-\"><a name=\"使用idea构建项目\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>使用idea构建项目</h2><ol>\n<li>File -&gt; New -&gt; Project 打开新建项目窗口</li><li><p>选择Spring Initializr，点击Next</p>\n<br> <img src=\"https://github.com/stephen-gao/image/blob/master/image/201905102100/20190510210001.png?raw=true\" width=\"400\" height=\"300\"><br>\n</li><li><p>Group、Artfact、Name(可默认)，点击Next</p>\n<br> <img src=\"https://github.com/stephen-gao/image/blob/master/image/201905102100/20190510210002.png?raw=true\" width=\"400\" height=\"300\"><br>\n</li><li><p>Web 勾选 Web，点击Next</p>\n<br> <img src=\"https://github.com/stephen-gao/image/blob/master/image/201905102100/20190510210003.png?raw=true\" width=\"400\" height=\"300\"><br>\n</li><li><p>Project name(可默认)，点击Finish</p>\n<br> <img src=\"https://github.com/stephen-gao/image/blob/master/image/201905102100/20190510210004.png?raw=true\" width=\"400\" height=\"300\"><br>\n</li><li><p>等待项目打开，Maven下载完依赖包即可,项目目录如图：</p>\n<br> <img src=\"https://github.com/stephen-gao/image/blob/master/image/201905102100/20190510210005.png?raw=true\" width=\"400\" height=\"300\"><br>\n\n</li></ol>\n<p>删除无用的文件，将application.properties改为application.yml(可以不改，只是个人觉得yml文件层级结构更加清晰，可读性更强)  </p>\n<ol>\n<li>在com.xxx.xxx.web下创建TestController文件(DemoApplication在com.xxx.xxx下，启动时会默认扫描它的同级的子目录下的文件)<br>```java<br>package com.gao.demo.web;</li></ol>\n<p>import org.springframework.web.bind.annotation.GetMapping;<br>import org.springframework.web.bind.annotation.PathVariable;<br>import org.springframework.web.bind.annotation.RequestMapping;<br>import org.springframework.web.bind.annotation.RestController;\n</p><p>/**</p>\n<ul>\n<li><a href=\"https://github.com/Author\" title=\"@Author\" class=\"at-link\">@Author</a> gao</li><li><a href=\"https://github.com/Date\" title=\"@Date\" class=\"at-link\">@Date</a> created time 2019/5/11 10:45</li><li><p><a href=\"https://github.com/Description\" title=\"@Description\" class=\"at-link\"></a><a href=\"https://github.com/Description\" title=\"@Description\" class=\"at-link\">@Description</a><br>*/<br><a href=\"https://github.com/RestController\" title=\"@RestController\" class=\"at-link\"></a><a href=\"https://github.com/RestController\" title=\"@RestController\" class=\"at-link\">@RestController</a><br><a href=\"https://github.com/RequestMapping\" title=\"@RequestMapping\" class=\"at-link\"></a><a href=\"https://github.com/RequestMapping\" title=\"@RequestMapping\" class=\"at-link\">@RequestMapping</a>(“test”)<br>public class TestController {\n</p><p> <a href=\"https://github.com/GetMapping\" title=\"@GetMapping\" class=\"at-link\"></a><a href=\"https://github.com/GetMapping\" title=\"@GetMapping\" class=\"at-link\">@GetMapping</a>(“index/{name}”)<br> public String index(<a href=\"https://github.com/PathVariable\" title=\"@PathVariable\" class=\"at-link\"></a><a href=\"https://github.com/PathVariable\" title=\"@PathVariable\" class=\"at-link\">@PathVariable</a> String name){</p>\n<pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code><span class=\"pln\"> </span><span class=\"kwd\">return</span><span class=\"pln\"> </span><span class=\"str\">\"hi \"</span><span class=\"pln\"> </span><span class=\"pun\">+</span><span class=\"pln\"> name </span><span class=\"pun\">+</span><span class=\"pln\"> </span><span class=\"str\">\"!\"</span><span class=\"pun\">;</span></code></li></ol></pre><p> }<br>}<br>```\n</p><ol>\n<li>选择DemoApplication，右键,选择Run DemoApplication或者IDEA右上角<br><img src=\"https://github.com/stephen-gao/image/blob/master/image/201905102100/20190510210006.png?raw=true\" width=\"350\" height=\"60\"><br>\n\n</li></ol>\n</li></ul>\n<p>没有的话自己添加，Edit Configruations -&gt; + -&gt; Spring Boot</p>\n<br>    <img src=\"https://github.com/stephen-gao/image/blob/master/image/201905102100/20190510210007.png?raw=true\" width=\"400\" height=\"240\"><br>\n\n<ol>\n<li><p>启动完成后，在浏览器输入 <a href=\"http://localhost:8080/test/index/stephen\">http://localhost:8080/test/index/stephen</a><br>返回结果：\n<br> <img src=\"https://github.com/stephen-gao/image/blob/master/image/201905102100/20190510210008.png?raw=true\" width=\"391\" height=\"136\"><br>\n</p></li><li><p>在application.yml中添加第一个配置,修改端口  </p>\n</li></ol>\n<pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code class=\"lang-yml\"><span class=\"pln\">server</span><span class=\"pun\">:</span></code></li><li class=\"L1\"><code class=\"lang-yml\"><span class=\"pln\">  port</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">8890</span></code></li></ol></pre>\n<p>至此第一个springboot项目完成了。</p>\n<h1 id=\"h1-u9A9Au64CDu4F5C\"><a name=\"骚操作\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>骚操作</h1><h2 id=\"h2--springboot-\"><a name=\"修改springboot启动控制台打印图案\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>修改springboot启动控制台打印图案</h2><p>在resources目录(application.yml同级目录)下添加banner.txt<br>添加代码：\n</p><pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code class=\"lang-txt\"><span class=\"pln\">                   _ooOoo_</span></code></li><li class=\"L1\"><code class=\"lang-txt\"><span class=\"pln\">                  o8888888o</span></code></li><li class=\"L2\"><code class=\"lang-txt\"><span class=\"pln\">                  </span><span class=\"lit\">88</span><span class=\"str\">\" . \"</span><span class=\"lit\">88</span></code></li><li class=\"L3\"><code class=\"lang-txt\"><span class=\"pln\">                  </span><span class=\"pun\">(|</span><span class=\"pln\"> </span><span class=\"pun\">-</span><span class=\"pln\">_</span><span class=\"pun\">-</span><span class=\"pln\"> </span><span class=\"pun\">|)</span></code></li><li class=\"L4\"><code class=\"lang-txt\"><span class=\"pln\">                  O\\  </span><span class=\"pun\">=</span><span class=\"pln\">  </span><span class=\"pun\">/</span><span class=\"pln\">O</span></code></li><li class=\"L5\"><code class=\"lang-txt\"><span class=\"pln\">               ____</span><span class=\"pun\">/</span><span class=\"str\">`---\'\\____</span></code></li><li class=\"L6\"><code class=\"lang-txt\"><span class=\"str\">             .\'  \\\\|     |//  `</span><span class=\"pun\">.</span></code></li><li class=\"L7\"><code class=\"lang-txt\"><span class=\"pln\">            </span><span class=\"pun\">/</span><span class=\"pln\">  \\\\</span><span class=\"pun\">|||</span><span class=\"pln\">  </span><span class=\"pun\">:</span><span class=\"pln\">  </span><span class=\"pun\">|||</span><span class=\"com\">//  \\</span></code></li><li class=\"L8\"><code class=\"lang-txt\"><span class=\"pln\">           </span><span class=\"pun\">/</span><span class=\"pln\">  _</span><span class=\"pun\">|||||</span><span class=\"pln\"> </span><span class=\"pun\">-:-</span><span class=\"pln\"> </span><span class=\"pun\">|||||-</span><span class=\"pln\">  \\</span></code></li><li class=\"L9\"><code class=\"lang-txt\"><span class=\"pln\">           </span><span class=\"pun\">|</span><span class=\"pln\">   </span><span class=\"pun\">|</span><span class=\"pln\"> \\\\\\  </span><span class=\"pun\">-</span><span class=\"pln\">  </span><span class=\"com\">/// |   |</span></code></li><li class=\"L0\"><code class=\"lang-txt\"><span class=\"pln\">           </span><span class=\"pun\">|</span><span class=\"pln\"> \\_</span><span class=\"pun\">|</span><span class=\"pln\">  </span><span class=\"str\">\'\'</span><span class=\"pln\">\\-</span><span class=\"pun\">--/</span><span class=\"str\">\'\'</span><span class=\"pln\">  </span><span class=\"pun\">|</span><span class=\"pln\">   </span><span class=\"pun\">|</span></code></li><li class=\"L1\"><code class=\"lang-txt\"><span class=\"pln\">           \\  </span><span class=\"pun\">.-</span><span class=\"pln\">\\__  </span><span class=\"str\">`-`</span><span class=\"pln\">  ___</span><span class=\"pun\">/-.</span><span class=\"pln\"> </span><span class=\"pun\">/</span></code></li><li class=\"L2\"><code class=\"lang-txt\"><span class=\"pln\">         ___</span><span class=\"str\">`. .\'  /--.--\\  `</span><span class=\"pun\">.</span><span class=\"pln\"> </span><span class=\"pun\">.</span><span class=\"pln\"> __</span></code></li><li class=\"L3\"><code class=\"lang-txt\"><span class=\"pln\">      </span><span class=\"pun\">.</span><span class=\"str\">\"\"</span><span class=\"pln\"> </span><span class=\"str\">\'&lt;  `.___\\_&lt;|&gt;_/___.\'</span><span class=\"pln\">  </span><span class=\"pun\">&gt;</span><span class=\"str\">\'\"\".</span></code></li><li class=\"L4\"><code class=\"lang-txt\"><span class=\"str\">     | | :  `- \\`.;`\\ _ /`;.`/ - ` : | |</span></code></li><li class=\"L5\"><code class=\"lang-txt\"><span class=\"str\">     \\  \\ `-.   \\_ __\\ /__ _/   .-` /  /</span></code></li><li class=\"L6\"><code class=\"lang-txt\"><span class=\"str\">======`-.____`-.___\\_____/___.-`____.-\'</span><span class=\"pun\">======</span></code></li><li class=\"L7\"><code class=\"lang-txt\"><span class=\"pln\">            </span><span class=\"pun\">佛祖保佑</span><span class=\"pln\">       </span><span class=\"pun\">永无</span><span class=\"pln\">BUG</span></code></li><li class=\"L8\"><code class=\"lang-txt\"><span class=\"typ\">Spring</span><span class=\"pln\"> </span><span class=\"typ\">Boot$</span><span class=\"pun\">{</span><span class=\"pln\">spring</span><span class=\"pun\">-</span><span class=\"pln\">boot</span><span class=\"pun\">.</span><span class=\"pln\">formatted</span><span class=\"pun\">-</span><span class=\"pln\">version</span><span class=\"pun\">}</span></code></li></ol></pre>\n<p>重新启动项目，查看控制台</p>\n<br>    <img src=\"https://github.com/stephen-gao/image/blob/master/image/201905102100/20190510210009.png?raw=true\" width=\"400\" height=\"400\"><br></div>', '2019-11-09 10:31:38', '2019-11-09 10:31:38');
INSERT INTO `t_article` VALUES ('b2933af38943ff58d5bed1de6c9c7bff', '191178nx7z2K', '<div class=\"markdown-body editormd-preview-container\" previewcontainer=\"true\" style=\"padding: 20px;\"><p>[toc]</p>\n<h1 id=\"h1-u6458u8981\"><a name=\"摘要\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>摘要</h1><p>本文主要讲解springboot整合MyBatis  </p>\n<p>上篇已经搭建了简单的springboot项目详情请见：<br><a href=\"http://note.youdao.com/noteshare?id=c84c78c699daee3ef56f8960dc5f5562&amp;sub=4694477CEC5944CDBD31FEB549302F2E\">猴子也能懂的springboot教程(一) | springboot入门</a><br>本次我们在原先代码基础上整合Mybatis<br>废话不说，开始\n</p><h1 id=\"h1-u8F6Fu4EF6u7248u672C\"><a name=\"软件版本\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>软件版本</h1><p><strong>mysql</strong> mysql 8.0.16<br><strong>需要注意</strong>：mysql8 使用的mysql-connector-java 8.x.x依赖中的驱动由之前版本的com.mysql.jdbc.Driver变为com.mysql.cj.jdbc.Driver</p>\n<h1 id=\"h1-u5EFAu8868\"><a name=\"建表\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>建表</h1><p>创建user表，字段：id,username,password<br>建表语句在源码resources/db/db.sql中\n</p><h1 id=\"h1-u4F9Du8D56\"><a name=\"依赖\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>依赖</h1><p>首先在POM文件中添加依赖</p>\n<pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code class=\"lang-xml\"><span class=\"pln\">    </span><span class=\"com\">&lt;!-- Spring Boot Mybatis 依赖 --&gt;</span></code></li><li class=\"L1\"><code class=\"lang-xml\"><span class=\"pln\">    </span><span class=\"tag\">&lt;dependency&gt;</span></code></li><li class=\"L2\"><code class=\"lang-xml\"><span class=\"pln\">        </span><span class=\"tag\">&lt;groupId&gt;</span><span class=\"pln\">org.mybatis.spring.boot</span><span class=\"tag\">&lt;/groupId&gt;</span></code></li><li class=\"L3\"><code class=\"lang-xml\"><span class=\"pln\">        </span><span class=\"tag\">&lt;artifactId&gt;</span><span class=\"pln\">mybatis-spring-boot-starter</span><span class=\"tag\">&lt;/artifactId&gt;</span></code></li><li class=\"L4\"><code class=\"lang-xml\"><span class=\"pln\">        </span><span class=\"tag\">&lt;version&gt;</span><span class=\"pln\">2.0.1</span><span class=\"tag\">&lt;/version&gt;</span></code></li><li class=\"L5\"><code class=\"lang-xml\"><span class=\"pln\">    </span><span class=\"tag\">&lt;/dependency&gt;</span></code></li><li class=\"L6\"><code class=\"lang-xml\"><span class=\"pln\">    </span><span class=\"tag\">&lt;dependency&gt;</span></code></li><li class=\"L7\"><code class=\"lang-xml\"><span class=\"pln\">        </span><span class=\"tag\">&lt;groupId&gt;</span><span class=\"pln\">mysql</span><span class=\"tag\">&lt;/groupId&gt;</span></code></li><li class=\"L8\"><code class=\"lang-xml\"><span class=\"pln\">        </span><span class=\"tag\">&lt;artifactId&gt;</span><span class=\"pln\">mysql-connector-java</span><span class=\"tag\">&lt;/artifactId&gt;</span></code></li><li class=\"L9\"><code class=\"lang-xml\"><span class=\"pln\">        </span><span class=\"tag\">&lt;version&gt;</span><span class=\"pln\">8.0.11</span><span class=\"tag\">&lt;/version&gt;</span></code></li><li class=\"L0\"><code class=\"lang-xml\"><span class=\"pln\">    </span><span class=\"tag\">&lt;/dependency&gt;</span></code></li><li class=\"L1\"><code class=\"lang-xml\"></code></li><li class=\"L2\"><code class=\"lang-xml\"><span class=\"pln\">    </span><span class=\"tag\">&lt;dependency&gt;</span></code></li><li class=\"L3\"><code class=\"lang-xml\"><span class=\"pln\">        </span><span class=\"tag\">&lt;groupId&gt;</span><span class=\"pln\">com.alibaba</span><span class=\"tag\">&lt;/groupId&gt;</span></code></li><li class=\"L4\"><code class=\"lang-xml\"><span class=\"pln\">        </span><span class=\"tag\">&lt;artifactId&gt;</span><span class=\"pln\">druid</span><span class=\"tag\">&lt;/artifactId&gt;</span></code></li><li class=\"L5\"><code class=\"lang-xml\"><span class=\"pln\">        </span><span class=\"tag\">&lt;version&gt;</span><span class=\"pln\">1.1.10</span><span class=\"tag\">&lt;/version&gt;</span></code></li><li class=\"L6\"><code class=\"lang-xml\"><span class=\"pln\">    </span><span class=\"tag\">&lt;/dependency&gt;</span></code></li><li class=\"L7\"><code class=\"lang-xml\"></code></li><li class=\"L8\"><code class=\"lang-xml\"><span class=\"pln\">    </span><span class=\"com\">&lt;!-- build中添加resources，解决打包时mapper.xml不被打包的问题 --&gt;</span></code></li><li class=\"L9\"><code class=\"lang-xml\"><span class=\"pln\">    </span><span class=\"com\">&lt;!-- 若mapper.xml在resources下，则不用添加 --&gt;</span></code></li><li class=\"L0\"><code class=\"lang-xml\"><span class=\"pln\">    </span><span class=\"tag\">&lt;build&gt;</span></code></li><li class=\"L1\"><code class=\"lang-xml\"><span class=\"pln\">        </span><span class=\"tag\">&lt;resources&gt;</span></code></li><li class=\"L2\"><code class=\"lang-xml\"><span class=\"pln\">            </span><span class=\"tag\">&lt;resource&gt;</span></code></li><li class=\"L3\"><code class=\"lang-xml\"><span class=\"pln\">                </span><span class=\"tag\">&lt;directory&gt;</span><span class=\"pln\">src/main/java</span><span class=\"tag\">&lt;/directory&gt;</span></code></li><li class=\"L4\"><code class=\"lang-xml\"><span class=\"pln\">                </span><span class=\"tag\">&lt;includes&gt;</span></code></li><li class=\"L5\"><code class=\"lang-xml\"><span class=\"pln\">                    </span><span class=\"tag\">&lt;include&gt;</span><span class=\"pln\">**/*.xml</span><span class=\"tag\">&lt;/include&gt;</span></code></li><li class=\"L6\"><code class=\"lang-xml\"><span class=\"pln\">                </span><span class=\"tag\">&lt;/includes&gt;</span></code></li><li class=\"L7\"><code class=\"lang-xml\"><span class=\"pln\">            </span><span class=\"tag\">&lt;/resource&gt;</span></code></li><li class=\"L8\"><code class=\"lang-xml\"><span class=\"pln\">        </span><span class=\"tag\">&lt;/resources&gt;</span></code></li><li class=\"L9\"><code class=\"lang-xml\"><span class=\"pln\">    </span><span class=\"tag\">&lt;/build&gt;</span></code></li></ol></pre>\n<h1 id=\"h1-u914Du7F6Eu6587u4EF6\"><a name=\"配置文件\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>配置文件</h1><p>在application.yml中添加数据源</p>\n<pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code class=\"lang-yml\"><span class=\"com\"># DataSource Config</span></code></li><li class=\"L1\"><code class=\"lang-yml\"><span class=\"pln\">spring</span><span class=\"pun\">:</span></code></li><li class=\"L2\"><code class=\"lang-yml\"><span class=\"pln\">  datasource</span><span class=\"pun\">:</span></code></li><li class=\"L3\"><code class=\"lang-yml\"><span class=\"pln\">    type</span><span class=\"pun\">:</span><span class=\"pln\"> com</span><span class=\"pun\">.</span><span class=\"pln\">alibaba</span><span class=\"pun\">.</span><span class=\"pln\">druid</span><span class=\"pun\">.</span><span class=\"pln\">pool</span><span class=\"pun\">.</span><span class=\"typ\">DruidDataSource</span></code></li><li class=\"L4\"><code class=\"lang-yml\"><span class=\"pln\">    driver</span><span class=\"pun\">-</span><span class=\"kwd\">class</span><span class=\"pun\">-</span><span class=\"pln\">name</span><span class=\"pun\">:</span><span class=\"pln\"> com</span><span class=\"pun\">.</span><span class=\"pln\">mysql</span><span class=\"pun\">.</span><span class=\"pln\">cj</span><span class=\"pun\">.</span><span class=\"pln\">jdbc</span><span class=\"pun\">.</span><span class=\"typ\">Driver</span></code></li><li class=\"L5\"><code class=\"lang-yml\"><span class=\"pln\">    url</span><span class=\"pun\">:</span><span class=\"pln\"> jdbc</span><span class=\"pun\">:</span><span class=\"pln\">mysql</span><span class=\"pun\">:</span><span class=\"com\">//192.168.162.134:3306/easywork?useSSL=false</span></code></li><li class=\"L6\"><code class=\"lang-yml\"><span class=\"pln\">    username</span><span class=\"pun\">:</span><span class=\"pln\"> root</span></code></li><li class=\"L7\"><code class=\"lang-yml\"><span class=\"pln\">    password</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"typ\">Root</span></code></li><li class=\"L8\"><code class=\"lang-yml\"><span class=\"com\">#mybatis</span></code></li><li class=\"L9\"><code class=\"lang-yml\"><span class=\"pln\">mybatis</span><span class=\"pun\">:</span></code></li><li class=\"L0\"><code class=\"lang-yml\"><span class=\"pln\">  mapper</span><span class=\"pun\">-</span><span class=\"pln\">locations</span><span class=\"pun\">:</span><span class=\"pln\"> classpath</span><span class=\"pun\">:</span><span class=\"str\">/com/</span><span class=\"pln\">gao</span><span class=\"com\">/**/</span><span class=\"pun\">*</span><span class=\"typ\">Mapper</span><span class=\"pun\">.</span><span class=\"pln\">xml</span></code></li><li class=\"L1\"><code class=\"lang-yml\"><span class=\"pln\">  type</span><span class=\"pun\">-</span><span class=\"pln\">aliases</span><span class=\"pun\">-</span><span class=\"kwd\">package</span><span class=\"pun\">:</span><span class=\"pln\"> com</span><span class=\"pun\">.</span><span class=\"pln\">gao</span><span class=\"pun\">.</span><span class=\"pln\">entity</span></code></li></ol></pre>\n<p>此时就可以启动项目了，数据库也连接上了。是不是发现springboot使用起来非常非常简便？下面我们创建实体测试一下</p>\n<h1 id=\"h1--\"><a name=\"完成，开始测试\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>完成，开始测试</h1><h2 id=\"h2--user-\"><a name=\"创建user实体\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>创建user实体</h2><pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code class=\"lang-java\"><span class=\"kwd\">package</span><span class=\"pln\"> com</span><span class=\"pun\">.</span><span class=\"pln\">gao</span><span class=\"pun\">.</span><span class=\"pln\">entity</span><span class=\"pun\">;</span></code></li><li class=\"L1\"><code class=\"lang-java\"></code></li><li class=\"L2\"><code class=\"lang-java\"><span class=\"kwd\">public</span><span class=\"pln\"> </span><span class=\"kwd\">class</span><span class=\"pln\"> </span><span class=\"typ\">User</span><span class=\"pln\"> </span><span class=\"pun\">{</span></code></li><li class=\"L3\"><code class=\"lang-java\"></code></li><li class=\"L4\"><code class=\"lang-java\"><span class=\"pln\">    </span><span class=\"kwd\">private</span><span class=\"pln\"> </span><span class=\"typ\">String</span><span class=\"pln\"> id</span><span class=\"pun\">;</span></code></li><li class=\"L5\"><code class=\"lang-java\"></code></li><li class=\"L6\"><code class=\"lang-java\"><span class=\"pln\">    </span><span class=\"kwd\">private</span><span class=\"pln\"> </span><span class=\"typ\">String</span><span class=\"pln\"> username</span><span class=\"pun\">;</span></code></li><li class=\"L7\"><code class=\"lang-java\"></code></li><li class=\"L8\"><code class=\"lang-java\"><span class=\"pln\">    </span><span class=\"kwd\">private</span><span class=\"pln\"> </span><span class=\"typ\">String</span><span class=\"pln\"> password</span><span class=\"pun\">;</span></code></li><li class=\"L9\"><code class=\"lang-java\"></code></li><li class=\"L0\"><code class=\"lang-java\"><span class=\"pln\">    getter</span><span class=\"pun\">/</span><span class=\"pln\">setter </span><span class=\"pun\">...</span></code></li><li class=\"L1\"><code class=\"lang-java\"><span class=\"pun\">}</span></code></li></ol></pre>\n<h2 id=\"h2--mapper-java\"><a name=\"创建mapper.java\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>创建mapper.java</h2><pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code class=\"lang-java\"><span class=\"kwd\">package</span><span class=\"pln\"> com</span><span class=\"pun\">.</span><span class=\"pln\">gao</span><span class=\"pun\">.</span><span class=\"pln\">dao</span><span class=\"pun\">;</span></code></li><li class=\"L1\"><code class=\"lang-java\"></code></li><li class=\"L2\"><code class=\"lang-java\"><span class=\"kwd\">import</span><span class=\"pln\"> </span><span class=\"pun\">...;</span></code></li><li class=\"L3\"><code class=\"lang-java\"></code></li><li class=\"L4\"><code class=\"lang-java\"><span class=\"lit\">@Mapper</span></code></li><li class=\"L5\"><code class=\"lang-java\"><span class=\"kwd\">public</span><span class=\"pln\"> </span><span class=\"kwd\">interface</span><span class=\"pln\"> </span><span class=\"typ\">UserMapper</span><span class=\"pln\"> </span><span class=\"pun\">{</span></code></li><li class=\"L6\"><code class=\"lang-java\"></code></li><li class=\"L7\"><code class=\"lang-java\"><span class=\"pln\">    </span><span class=\"typ\">User</span><span class=\"pln\"> getUserByName</span><span class=\"pun\">(</span><span class=\"typ\">String</span><span class=\"pln\"> username</span><span class=\"pun\">);</span></code></li><li class=\"L8\"><code class=\"lang-java\"><span class=\"pun\">}</span></code></li></ol></pre>\n<h2 id=\"h2--mapper-xml\"><a name=\"创建mapper.xml\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>创建mapper.xml</h2><pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code class=\"lang-xml\"><span class=\"pun\">&lt;?</span><span class=\"pln\">xml version</span><span class=\"pun\">=</span><span class=\"str\">\"1.0\"</span><span class=\"pln\"> encoding</span><span class=\"pun\">=</span><span class=\"str\">\"UTF-8\"</span><span class=\"pun\">?&gt;</span></code></li><li class=\"L1\"><code class=\"lang-xml\"><span class=\"dec\">&lt;!DOCTYPE mapper PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\"</span></code></li><li class=\"L2\"><code class=\"lang-xml\"><span class=\"dec\">\"http://mybatis.org/dtd/mybatis-3-mapper.dtd\"&gt;</span></code></li><li class=\"L3\"><code class=\"lang-xml\"><span class=\"tag\">&lt;mapper</span><span class=\"pln\"> </span><span class=\"atn\">namespace</span><span class=\"pun\">=</span><span class=\"atv\">\"com.gao.dao.UserMapper\"</span><span class=\"tag\">&gt;</span></code></li><li class=\"L4\"><code class=\"lang-xml\"></code></li><li class=\"L5\"><code class=\"lang-xml\"><span class=\"pln\">    </span><span class=\"tag\">&lt;select</span><span class=\"pln\"> </span><span class=\"atn\">id</span><span class=\"pun\">=</span><span class=\"atv\">\"getUserByName\"</span><span class=\"pln\"> </span><span class=\"atn\">parameterType</span><span class=\"pun\">=</span><span class=\"atv\">\"String\"</span><span class=\"pln\"> </span><span class=\"atn\">resultType</span><span class=\"pun\">=</span><span class=\"atv\">\"User\"</span><span class=\"tag\">&gt;</span></code></li><li class=\"L6\"><code class=\"lang-xml\"><span class=\"pln\">        SELECT id, username, password </span></code></li><li class=\"L7\"><code class=\"lang-xml\"><span class=\"pln\">        FROM user </span></code></li><li class=\"L8\"><code class=\"lang-xml\"><span class=\"pln\">        WHERE username = #{username}</span></code></li><li class=\"L9\"><code class=\"lang-xml\"><span class=\"pln\">    </span><span class=\"tag\">&lt;/select&gt;</span></code></li><li class=\"L0\"><code class=\"lang-xml\"><span class=\"tag\">&lt;/mapper&gt;</span></code></li></ol></pre>\n<h2 id=\"h2--service\"><a name=\"创建service\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>创建service</h2><p>接口和impl</p>\n<pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code class=\"lang-java\"><span class=\"kwd\">package</span><span class=\"pln\"> com</span><span class=\"pun\">.</span><span class=\"pln\">gao</span><span class=\"pun\">.</span><span class=\"pln\">service</span><span class=\"pun\">;</span></code></li><li class=\"L1\"><code class=\"lang-java\"></code></li><li class=\"L2\"><code class=\"lang-java\"><span class=\"kwd\">import</span><span class=\"pln\"> com</span><span class=\"pun\">.</span><span class=\"pln\">gao</span><span class=\"pun\">.</span><span class=\"pln\">entity</span><span class=\"pun\">.</span><span class=\"typ\">User</span><span class=\"pun\">;</span></code></li><li class=\"L3\"><code class=\"lang-java\"></code></li><li class=\"L4\"><code class=\"lang-java\"><span class=\"kwd\">public</span><span class=\"pln\"> </span><span class=\"kwd\">interface</span><span class=\"pln\"> </span><span class=\"typ\">IUserService</span><span class=\"pln\"> </span><span class=\"pun\">{</span></code></li><li class=\"L5\"><code class=\"lang-java\"><span class=\"pln\">    </span><span class=\"typ\">User</span><span class=\"pln\"> getUserByUsername</span><span class=\"pun\">(</span><span class=\"typ\">String</span><span class=\"pln\"> username</span><span class=\"pun\">);</span></code></li><li class=\"L6\"><code class=\"lang-java\"><span class=\"pun\">}</span></code></li></ol></pre>\n<p>impl</p>\n<pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code class=\"lang-java\"><span class=\"kwd\">package</span><span class=\"pln\"> com</span><span class=\"pun\">.</span><span class=\"pln\">gao</span><span class=\"pun\">.</span><span class=\"pln\">service</span><span class=\"pun\">.</span><span class=\"pln\">impl</span><span class=\"pun\">;</span></code></li><li class=\"L1\"><code class=\"lang-java\"></code></li><li class=\"L2\"><code class=\"lang-java\"><span class=\"kwd\">import</span><span class=\"pln\"> </span><span class=\"pun\">...;</span></code></li><li class=\"L3\"><code class=\"lang-java\"></code></li><li class=\"L4\"><code class=\"lang-java\"><span class=\"lit\">@Service</span></code></li><li class=\"L5\"><code class=\"lang-java\"><span class=\"kwd\">public</span><span class=\"pln\"> </span><span class=\"kwd\">class</span><span class=\"pln\"> </span><span class=\"typ\">UserServiceIml</span><span class=\"pln\"> </span><span class=\"kwd\">implements</span><span class=\"pln\"> </span><span class=\"typ\">IUserService</span><span class=\"pun\">{</span></code></li><li class=\"L6\"><code class=\"lang-java\"></code></li><li class=\"L7\"><code class=\"lang-java\"><span class=\"pln\">    </span><span class=\"lit\">@Autowired</span></code></li><li class=\"L8\"><code class=\"lang-java\"><span class=\"pln\">    </span><span class=\"kwd\">private</span><span class=\"pln\"> </span><span class=\"typ\">UserMapper</span><span class=\"pln\"> userMapper</span><span class=\"pun\">;</span></code></li><li class=\"L9\"><code class=\"lang-java\"></code></li><li class=\"L0\"><code class=\"lang-java\"><span class=\"pln\">    </span><span class=\"lit\">@Override</span></code></li><li class=\"L1\"><code class=\"lang-java\"><span class=\"pln\">    </span><span class=\"kwd\">public</span><span class=\"pln\"> </span><span class=\"typ\">User</span><span class=\"pln\"> getUserByUsername</span><span class=\"pun\">(</span><span class=\"typ\">String</span><span class=\"pln\"> username</span><span class=\"pun\">)</span><span class=\"pln\"> </span><span class=\"pun\">{</span></code></li><li class=\"L2\"><code class=\"lang-java\"><span class=\"pln\">        </span><span class=\"kwd\">return</span><span class=\"pln\"> userMapper</span><span class=\"pun\">.</span><span class=\"pln\">getUserByName</span><span class=\"pun\">(</span><span class=\"pln\">username</span><span class=\"pun\">);</span></code></li><li class=\"L3\"><code class=\"lang-java\"><span class=\"pln\">    </span><span class=\"pun\">}</span></code></li><li class=\"L4\"><code class=\"lang-java\"><span class=\"pun\">}</span></code></li></ol></pre>\n<h2 id=\"h2--controller\"><a name=\"编辑Controller\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>编辑Controller</h2><p>修改上次的TestController</p>\n<pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code class=\"lang-java\"><span class=\"kwd\">package</span><span class=\"pln\"> com</span><span class=\"pun\">.</span><span class=\"pln\">gao</span><span class=\"pun\">.</span><span class=\"pln\">web</span><span class=\"pun\">;</span></code></li><li class=\"L1\"><code class=\"lang-java\"></code></li><li class=\"L2\"><code class=\"lang-java\"><span class=\"kwd\">import</span><span class=\"pln\"> </span><span class=\"pun\">...;</span></code></li><li class=\"L3\"><code class=\"lang-java\"></code></li><li class=\"L4\"><code class=\"lang-java\"><span class=\"lit\">@RestController</span></code></li><li class=\"L5\"><code class=\"lang-java\"><span class=\"lit\">@RequestMapping</span><span class=\"pun\">(</span><span class=\"str\">\"test\"</span><span class=\"pun\">)</span></code></li><li class=\"L6\"><code class=\"lang-java\"><span class=\"kwd\">public</span><span class=\"pln\"> </span><span class=\"kwd\">class</span><span class=\"pln\"> </span><span class=\"typ\">TestController</span><span class=\"pln\"> </span><span class=\"pun\">{</span></code></li><li class=\"L7\"><code class=\"lang-java\"></code></li><li class=\"L8\"><code class=\"lang-java\"><span class=\"pln\">    </span><span class=\"lit\">@Autowired</span></code></li><li class=\"L9\"><code class=\"lang-java\"><span class=\"pln\">    </span><span class=\"kwd\">private</span><span class=\"pln\"> </span><span class=\"typ\">IUserService</span><span class=\"pln\"> userService</span><span class=\"pun\">;</span></code></li><li class=\"L0\"><code class=\"lang-java\"></code></li><li class=\"L1\"><code class=\"lang-java\"><span class=\"pln\">    </span><span class=\"lit\">@GetMapping</span><span class=\"pun\">(</span><span class=\"str\">\"index/{name}\"</span><span class=\"pun\">)</span></code></li><li class=\"L2\"><code class=\"lang-java\"><span class=\"pln\">    </span><span class=\"kwd\">public</span><span class=\"pln\"> </span><span class=\"typ\">String</span><span class=\"pln\"> index</span><span class=\"pun\">(</span><span class=\"lit\">@PathVariable</span><span class=\"pln\"> </span><span class=\"typ\">String</span><span class=\"pln\"> name</span><span class=\"pun\">){</span></code></li><li class=\"L3\"><code class=\"lang-java\"><span class=\"pln\">        </span><span class=\"typ\">User</span><span class=\"pln\"> user </span><span class=\"pun\">=</span><span class=\"pln\"> userService</span><span class=\"pun\">.</span><span class=\"pln\">getUserByUsername</span><span class=\"pun\">(</span><span class=\"pln\">name</span><span class=\"pun\">);</span></code></li><li class=\"L4\"><code class=\"lang-java\"><span class=\"pln\">        </span><span class=\"kwd\">return</span><span class=\"pln\"> </span><span class=\"str\">\"hi \"</span><span class=\"pln\"> </span><span class=\"pun\">+</span><span class=\"pln\"> user</span><span class=\"pun\">.</span><span class=\"pln\">getUsername</span><span class=\"pun\">()</span><span class=\"pln\"> </span><span class=\"pun\">+</span><span class=\"pln\"> </span><span class=\"str\">\" your id is \"</span><span class=\"pun\">+</span><span class=\"pln\"> user</span><span class=\"pun\">.</span><span class=\"pln\">getId</span><span class=\"pun\">();</span></code></li><li class=\"L5\"><code class=\"lang-java\"><span class=\"pln\">    </span><span class=\"pun\">}</span></code></li><li class=\"L6\"><code class=\"lang-java\"><span class=\"pun\">}</span></code></li></ol></pre>\n<h2 id=\"h2-u542Fu52A8u5E76u6D4Bu8BD5\"><a name=\"启动并测试\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>启动并测试</h2><br>    <img src=\"https://github.com/stephen-gao/image/blob/master/image/201905131800/20190513180001.png?raw=true\" width=\"470\" height=\"186\"><br></div>', '2019-11-09 10:00:20', '2019-11-09 10:00:20');
INSERT INTO `t_article` VALUES ('b9ea788a307af8830553c6b18b6df620', '1911h0VxcEoG', '<div class=\"markdown-body editormd-preview-container\" previewcontainer=\"true\" style=\"padding: 20px;\"><p>asas</p>\n</div>', '2019-11-16 11:39:15', '2019-11-16 11:39:15');
INSERT INTO `t_article` VALUES ('c685382a4a3b04d055a3e80914434ce9', '1911T1nQ3MZz', '<p>asadasfvfdvdfv</p>\n', '2019-11-05 12:19:33', '2019-11-05 12:19:33');
INSERT INTO `t_article` VALUES ('dbd4c684646c4447322ef2c76b49e5b9', '191169XV1IGh', '<div class=\"markdown-body editormd-preview-container\" previewcontainer=\"true\" style=\"padding: 20px;\"><p>nmnmnm1</p>\n</div>', '2019-11-14 21:06:14', '2019-11-14 21:06:14');

-- ----------------------------
-- Table structure for t_article_info
-- ----------------------------
DROP TABLE IF EXISTS `t_article_info`;
CREATE TABLE `t_article_info` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `author_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '作者ID',
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题ID',
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `category_id` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `views_num` bigint(16) DEFAULT NULL COMMENT '浏览量',
  `comment_num` bigint(16) DEFAULT NULL COMMENT '评论数',
  `star_num` bigint(16) DEFAULT NULL COMMENT '点赞数',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '编辑时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_article_info
-- ----------------------------
INSERT INTO `t_article_info` VALUES ('191169XV1IGh', '0', 'mnmnmnmnm', 'nmnm1', 'nmnm1', 'jwSII7MM', 'http://localhost:8080/a/191169XV1IGh', '2', '0', '0', '0', '2019-11-14 21:06:14', '2019-11-14 21:06:14');
INSERT INTO `t_article_info` VALUES ('191178nx7z2K', '0', '猴子也能懂的springboot教程(二) - springboot整合Mybatis', '猴子也能懂的springboot教程(二) - springboot整合Mybatis', '猴子也能懂的springboot教程(二) - springboot整合Mybatis', '6GLlV2Eu', 'http://localhost:8080/a/191178nx7z2K', '18', '0', '0', '0', '2019-11-09 10:00:20', '2019-11-09 10:00:20');
INSERT INTO `t_article_info` VALUES ('1911h0VxcEoG', '0', 'asdadasd', 'adasd', 'adasd', '6GLlV2Eu', 'http://localhost:8080/a/1911h0VxcEoG', '0', '0', '0', '1', '2019-11-16 11:39:15', '2019-11-16 11:39:15');
INSERT INTO `t_article_info` VALUES ('1911lG1TdjMz', '0', 'aaaaa', 'aaaaa', 'aaa', '6GLlV2Eu', 'http://localhost:8080/a/1911lG1TdjMz', '11', '0', '0', '0', '2019-11-05 20:21:53', '2019-11-05 20:21:53');
INSERT INTO `t_article_info` VALUES ('1911srXIM35e', '0', 'vvvvvv', 'vvvvvvvvvv', 'vvvvvvvvvvvv', '6GLlV2Eu', 'http://localhost:8080/a/1911srXIM35e', '0', '0', '0', '0', '2019-11-05 20:24:39', '2019-11-05 20:24:39');
INSERT INTO `t_article_info` VALUES ('1911T1nQ3MZz', '0', 'dfvdfvdfv', 'dfvdfv', 'dfvdfvd', '6GLlV2Eu', 'http://localhost:8080/a/1911T1nQ3MZz', '0', '0', '0', '0', '2019-11-05 12:21:53', '2019-11-05 12:21:53');
INSERT INTO `t_article_info` VALUES ('1911TteflNXd', '0', 'asas', 'asdasd', 'asdasda', '6GLlV2Eu', 'http://localhost:8080/a/1911TteflNXd', '2', '0', '0', '0', '2019-11-16 13:36:36', '2019-11-16 13:36:36');
INSERT INTO `t_article_info` VALUES ('1911x3mugPKI', '0', '猴子也能懂的springboot教程(一) - springboot入门', '猴子也能懂的springboot教程(一) - springboot入门', '猴子也能懂的springboot教程(一) - springboot入门', 'jwSII7MM', 'http://localhost:8080/a/1911x3mugPKI', '19', '0', '0', '0', '2019-11-09 10:31:38', '2019-11-09 10:31:38');

-- ----------------------------
-- Table structure for t_article_src
-- ----------------------------
DROP TABLE IF EXISTS `t_article_src`;
CREATE TABLE `t_article_src` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `article_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文章ID',
  `content_src` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '原始内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_article_src
-- ----------------------------
INSERT INTO `t_article_src` VALUES ('039e8dd7254b0b9fe87925fd8e48b107', '1911h0VxcEoG', 'asas', '2019-11-16 11:39:15', '2019-11-16 11:39:15');
INSERT INTO `t_article_src` VALUES ('04c40ac72f7dfd3e42facc20d7049a70', '1911TteflNXd', 'asdasdasdasdasdasddddd', '2019-11-16 13:36:36', '2019-11-16 13:36:36');
INSERT INTO `t_article_src` VALUES ('07add05392447675b166812ba7aea7c0', '1911T1nQ3MZz', 'asadasfvfdvdfv', '2019-11-05 12:19:33', '2019-11-05 12:19:33');
INSERT INTO `t_article_src` VALUES ('412e0ab145822eb34e0e11dd2ab5dc79', '1911srXIM35e', 'vvvvvvvvv', '2019-11-05 20:24:39', '2019-11-05 20:24:39');
INSERT INTO `t_article_src` VALUES ('492a2bcd8325703e8d06cacd640777ba', '191178nx7z2K', '[toc]\n# 摘要\n本文主要讲解springboot整合MyBatis  \n\n上篇已经搭建了简单的springboot项目详情请见：  \n[猴子也能懂的springboot教程(一) | springboot入门](http://note.youdao.com/noteshare?id=c84c78c699daee3ef56f8960dc5f5562&sub=4694477CEC5944CDBD31FEB549302F2E)  \n本次我们在原先代码基础上整合Mybatis  \n废话不说，开始\n\n\n# 软件版本\n**mysql** mysql 8.0.16  \n**需要注意**：mysql8 使用的mysql-connector-java 8.x.x依赖中的驱动由之前版本的com.mysql.jdbc.Driver变为com.mysql.cj.jdbc.Driver\n\n# 建表\n创建user表，字段：id,username,password\n建表语句在源码resources/db/db.sql中\n# 依赖\n首先在POM文件中添加依赖\n```xml\n    <!-- Spring Boot Mybatis 依赖 -->\n	<dependency>\n		<groupId>org.mybatis.spring.boot</groupId>\n		<artifactId>mybatis-spring-boot-starter</artifactId>\n		<version>2.0.1</version>\n	</dependency>\n    <dependency>\n    	<groupId>mysql</groupId>\n    	<artifactId>mysql-connector-java</artifactId>\n    	<version>8.0.11</version>\n    </dependency>\n    \n    <dependency>\n    	<groupId>com.alibaba</groupId>\n    	<artifactId>druid</artifactId>\n    	<version>1.1.10</version>\n    </dependency>\n    \n    <!-- build中添加resources，解决打包时mapper.xml不被打包的问题 -->\n    <!-- 若mapper.xml在resources下，则不用添加 -->\n    <build>\n		<resources>\n			<resource>\n				<directory>src/main/java</directory>\n				<includes>\n					<include>**/*.xml</include>\n				</includes>\n			</resource>\n		</resources>\n	</build>\n```\n# 配置文件\n在application.yml中添加数据源\n\n```yml\n# DataSource Config\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.162.134:3306/easywork?useSSL=false\n    username: root\n    password: Root\n#mybatis\nmybatis:\n  mapper-locations: classpath:/com/gao/**/*Mapper.xml\n  type-aliases-package: com.gao.entity\n```\n此时就可以启动项目了，数据库也连接上了。是不是发现springboot使用起来非常非常简便？下面我们创建实体测试一下\n# 完成，开始测试\n## 创建user实体\n\n```java\npackage com.gao.entity;\n\npublic class User {\n\n    private String id;\n\n    private String username;\n\n    private String password;\n\n    getter/setter ...\n}\n```\n## 创建mapper.java\n\n```java\npackage com.gao.dao;\n\nimport ...;\n\n@Mapper\npublic interface UserMapper {\n\n    User getUserByName(String username);\n}\n```\n## 创建mapper.xml\n```xml\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE mapper PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\"\n\"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">\n<mapper namespace=\"com.gao.dao.UserMapper\">\n\n    <select id=\"getUserByName\" parameterType=\"String\" resultType=\"User\">\n        SELECT id, username, password \n        FROM user \n        WHERE username = #{username}\n    </select>\n</mapper>\n```\n## 创建service\n接口和impl\n\n```java\npackage com.gao.service;\n\nimport com.gao.entity.User;\n\npublic interface IUserService {\n    User getUserByUsername(String username);\n}\n```\nimpl\n\n```java\npackage com.gao.service.impl;\n\nimport ...;\n\n@Service\npublic class UserServiceIml implements IUserService{\n\n    @Autowired\n    private UserMapper userMapper;\n\n    @Override\n    public User getUserByUsername(String username) {\n        return userMapper.getUserByName(username);\n    }\n}\n```\n\n## 编辑Controller\n修改上次的TestController\n\n```java\npackage com.gao.web;\n\nimport ...;\n\n@RestController\n@RequestMapping(\"test\")\npublic class TestController {\n\n    @Autowired\n    private IUserService userService;\n\n    @GetMapping(\"index/{name}\")\n    public String index(@PathVariable String name){\n        User user = userService.getUserByUsername(name);\n        return \"hi \" + user.getUsername() + \" your id is \"+ user.getId();\n    }\n}\n```\n## 启动并测试\n<html>\n    <img src=\"https://github.com/stephen-gao/image/blob/master/image/201905131800/20190513180001.png?raw=true\" width=470 height=186 />\n</html>', '2019-11-09 10:00:20', '2019-11-09 10:00:20');
INSERT INTO `t_article_src` VALUES ('7201892af583cd7187375aa4b9e0ee7e', '1911x3mugPKI', '[toc]\n# 摘要\nspringboot项目构建  \nspringboot启动控制台图案修改\n# springboot是什么\nSpring Boot 是由 Pivotal 团队提供的全新框架，其设计目的是用来简化新 Spring 应用的初始搭建以及开发过程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。(百度百科)  \n简单来说，就是我们最初用过的ssm、ssh框架，在构建项目时需要繁杂的配置文件：  \n使用spring就要扫描包、异常拦截器、过滤器、事务等  \n使用myBatis/hibernate要有dataSource,sqlSessionFactory,MapperScan等bean配置  \n每引入一个框架，就需要一堆配置文件。  \nspringboot可以看做是对我们要引入的框架做了默认的实现，引入后若没有特别要求，只需要少量必要的配置如（ip,端口），甚至是零配置就可以实现新框架的引入。\n# 为什么要学springboot\n从上段已经能看书，springboot在构建项目时大大减少工作量。  \n其实，在编码和部署时springboot也大大减少了工作量\n编程时大量使用注解式编程，简化了代码量，和编程复杂程度\n部署时可打成可执行jar包，直接用java -jar命令启动  \n\n自从用了springboot,腰不酸了，腿不疼了，一口气能上五楼了\n# 构建第一个springboot项目\n夸了半天，不再废话，直接上手  \n## 使用idea构建项目\n1. File -> New -> Project 打开新建项目窗口\n2. 选择Spring Initializr，点击Next\n<html>\n    <img src=\"https://github.com/stephen-gao/image/blob/master/image/201905102100/20190510210001.png?raw=true\" width=400 height=300 />\n</html>\n\n3. Group、Artfact、Name(可默认)，点击Next\n<html>\n    <img src=\"https://github.com/stephen-gao/image/blob/master/image/201905102100/20190510210002.png?raw=true\" width=400 height=300 />\n</html>\n\n4. Web 勾选 Web，点击Next\n<html>\n    <img src=\"https://github.com/stephen-gao/image/blob/master/image/201905102100/20190510210003.png?raw=true\" width=400 height=300 />\n</html>\n\n5. Project name(可默认)，点击Finish\n<html>\n    <img src=\"https://github.com/stephen-gao/image/blob/master/image/201905102100/20190510210004.png?raw=true\" width=400 height=300 />\n</html>\n\n6. 等待项目打开，Maven下载完依赖包即可,项目目录如图：\n<html>\n    <img src=\"https://github.com/stephen-gao/image/blob/master/image/201905102100/20190510210005.png?raw=true\" width=400 height=300 />\n</html>\n\n删除无用的文件，将application.properties改为application.yml(可以不改，只是个人觉得yml文件层级结构更加清晰，可读性更强)  \n7. 在com.xxx.xxx.web下创建TestController文件(DemoApplication在com.xxx.xxx下，启动时会默认扫描它的同级的子目录下的文件)\n```java\npackage com.gao.demo.web;\n\nimport org.springframework.web.bind.annotation.GetMapping;\nimport org.springframework.web.bind.annotation.PathVariable;\nimport org.springframework.web.bind.annotation.RequestMapping;\nimport org.springframework.web.bind.annotation.RestController;\n\n/**\n * @Author gao\n * @Date created time 2019/5/11 10:45\n * @Description\n */\n@RestController\n@RequestMapping(\"test\")\npublic class TestController {\n\n    @GetMapping(\"index/{name}\")\n    public String index(@PathVariable String name){\n        return \"hi \" + name + \"!\";\n    }\n}\n```\n8. 选择DemoApplication，右键,选择Run DemoApplication或者IDEA右上角\n<html>\n    <img src=\"https://github.com/stephen-gao/image/blob/master/image/201905102100/20190510210006.png?raw=true\" width=350 height=60 />\n</html>\n\n没有的话自己添加，Edit Configruations -> + -> Spring Boot\n<html>\n    <img src=\"https://github.com/stephen-gao/image/blob/master/image/201905102100/20190510210007.png?raw=true\" width=400 height=240 />\n</html>\n\n9. 启动完成后，在浏览器输入 http://localhost:8080/test/index/stephen  \n返回结果：\n<html>\n    <img src=\"https://github.com/stephen-gao/image/blob/master/image/201905102100/20190510210008.png?raw=true\" width=391 height=136 />\n</html>\n\n10. 在application.yml中添加第一个配置,修改端口  \n\n```yml\nserver:\n  port: 8890\n```\n\n至此第一个springboot项目完成了。\n\n# 骚操作\n## 修改springboot启动控制台打印图案  \n在resources目录(application.yml同级目录)下添加banner.txt  \n添加代码：\n```txt\n                   _ooOoo_\n                  o8888888o\n                  88\" . \"88\n                  (| -_- |)\n                  O\\  =  /O\n               ____/`---\'\\____\n             .\'  \\\\|     |//  `.\n            /  \\\\|||  :  |||//  \\\n           /  _||||| -:- |||||-  \\\n           |   | \\\\\\  -  /// |   |\n           | \\_|  \'\'\\---/\'\'  |   |\n           \\  .-\\__  `-`  ___/-. /\n         ___`. .\'  /--.--\\  `. . __\n      .\"\" \'<  `.___\\_<|>_/___.\'  >\'\"\".\n     | | :  `- \\`.;`\\ _ /`;.`/ - ` : | |\n     \\  \\ `-.   \\_ __\\ /__ _/   .-` /  /\n======`-.____`-.___\\_____/___.-`____.-\'======\n            佛祖保佑       永无BUG\nSpring Boot${spring-boot.formatted-version}\n```\n重新启动项目，查看控制台\n<html>\n    <img src=\"https://github.com/stephen-gao/image/blob/master/image/201905102100/20190510210009.png?raw=true\" width=400 height=400 />\n</html>', '2019-11-09 10:31:38', '2019-11-09 10:31:38');
INSERT INTO `t_article_src` VALUES ('7e6061811aa504e5c078008d1f54a4e2', '1911lG1TdjMz', 'aaaa', '2019-11-05 12:21:53', '2019-11-05 12:21:53');
INSERT INTO `t_article_src` VALUES ('8bc3e1e87f6e5c1c4798f9ed6a576626', '191169XV1IGh', 'nmnmnm1', '2019-11-14 21:06:14', '2019-11-14 21:06:14');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sort` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('5K9fOoKZ', '随笔', '随笔', 'http://localhost:8080/c/5K9fOoKZ', '5');
INSERT INTO `t_category` VALUES ('6GLlV2Eu', 'java', 'java', 'http://localhost:8080/c/6GLlV2Eu', '1');
INSERT INTO `t_category` VALUES ('jwSII7MM', 'spring', 'spring', 'http://localhost:8080/c/jwSII7MM', '2');
INSERT INTO `t_category` VALUES ('o96Gl3x6', '异常', '异常', 'http://localhost:8080/c/o96Gl3x6', '4');
INSERT INTO `t_category` VALUES ('P80LEK7c', '框架', '框架', 'http://localhost:8080/c/P80LEK7c', '3');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限ID',
  `pid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'root' COMMENT '父节点ID',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限编码',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限名称',
  `type` int(4) DEFAULT NULL COMMENT '类型 0叶子，1 非叶子, 2 接口',
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限描述',
  `sort` int(4) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='权限表';

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('00afe8f2689424796a0a45f431f548ec', '9b3bfb46abeaa6d7bb7bee44466079bf', '/manage/role/role-add', '角色添加', '2', '', '角色添加', '522');
INSERT INTO `t_permission` VALUES ('0e43438893f3b401c360fe7e82b4a3fa', '42337d91507df7cb8e6f926ca22df265', '/manage/user/user-page-data', '用户列表', '2', '', '用户列表', '511');
INSERT INTO `t_permission` VALUES ('0fe4353e5ed416347684d32547c5c8a9', 'a707e27f38323471f3e452357287801b', '/manage/article/page', '文章管理', '1', '', '文章管理', '220');
INSERT INTO `t_permission` VALUES ('1cf4f6eeff19a6fab6eb7fbcaeb1fb46', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/manage/user/user-page', '皮肤管理', '1', '', '皮肤管理', '550');
INSERT INTO `t_permission` VALUES ('1d53173fdd615094ba05de78523275f4', '74a179eb95480cc874f527b178ac3d03', '/manage/category/add', '分类添加', '2', '', '分类添加', '231');
INSERT INTO `t_permission` VALUES ('2de9951792266c1bd1b2de3926ea2558', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/manage/user/user-page', '插件管理', '1', '', '插件管理', '540');
INSERT INTO `t_permission` VALUES ('2ec1c4b866955645baee8e3076b932b2', 'root', '/manage/coffee', '广告', '0', 'menu-icon fa fa-coffee', '广告', '300');
INSERT INTO `t_permission` VALUES ('3fcfb38b748a71d5de9192bb8ad1608d', 'de81bd38bcfb555406326377c076b3c6', '/manage/permission/permission-delete', '权限删除', '2', '', '权限删除', '534');
INSERT INTO `t_permission` VALUES ('42337d91507df7cb8e6f926ca22df265', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/manage/user/user-page', '用户管理', '1', '', '用户管理', '510');
INSERT INTO `t_permission` VALUES ('43d5de55a83f1a6b1f5e38637d4bb26a', '0fe4353e5ed416347684d32547c5c8a9', '/manage/article/delete', '文章删除', '2', '', '文章删除', '224');
INSERT INTO `t_permission` VALUES ('4a119b964f283aeee15ad68fc43c0ceb', 'dae7e0793d636fd777af0ac8ef3ac94c', '/manage/special/add', '专题添加', '2', '', '专题添加', '242');
INSERT INTO `t_permission` VALUES ('4ee0989e3a2eb3367f41d888d810ba63', 'dae7e0793d636fd777af0ac8ef3ac94c', '/manage/special/update', '专题编辑', '2', '', '专题编辑', '243');
INSERT INTO `t_permission` VALUES ('565b9d7371a36099fc598fbf24709fc2', '9b3bfb46abeaa6d7bb7bee44466079bf', '/manage/role/role-delete', '角色删除', '2', '', '角色删除', '524');
INSERT INTO `t_permission` VALUES ('59e5135bff5e75051a0cc100bc9a641e', '74a179eb95480cc874f527b178ac3d03', '/manage/category/all', '全部分类', '2', '', '全部分类', '235');
INSERT INTO `t_permission` VALUES ('68e2797df196555f696e5469ceb05cca', 'dae7e0793d636fd777af0ac8ef3ac94c', '/manage/special/all', '全部专题', '2', '', '全部专题', '245');
INSERT INTO `t_permission` VALUES ('6fb16af9095202bcfd71ffcb5cebd896', '9b3bfb46abeaa6d7bb7bee44466079bf', '/manage/role/role-edit', '角色编辑', '2', '', '角色编辑', '523');
INSERT INTO `t_permission` VALUES ('74a179eb95480cc874f527b178ac3d03', 'a707e27f38323471f3e452357287801b', '/manage/category/page', '分类管理', '1', '', '分类管理', '230');
INSERT INTO `t_permission` VALUES ('760228cfeab3640219deae51cc3b0b69', 'de81bd38bcfb555406326377c076b3c6', '/manage/permission/permission-add', '权限添加', '2', '', '权限添加', '532');
INSERT INTO `t_permission` VALUES ('768482ddabf459b3a6b79360ab4090d2', '2ec1c4b866955645baee8e3076b932b2', '/manage/coffee/page', '广告管理', '1', '', '广告管理', '310');
INSERT INTO `t_permission` VALUES ('7ccf03954968a566ec349aca74901267', 'root', '/manage/statistics', '统计', '0', 'menu-icon fa fa-pie-chart', '统计', '100');
INSERT INTO `t_permission` VALUES ('7e3376cf746e0eacb7761342cec95198', '0fe4353e5ed416347684d32547c5c8a9', '/manage/article/edit-page', '文章编辑页', '2', '', '文章编辑页', '222');
INSERT INTO `t_permission` VALUES ('7f37a751181aa8cd019b4663e197a11d', 'de81bd38bcfb555406326377c076b3c6', '/manage/permission/permission-edit', '权限编辑', '2', '', '权限编辑', '533');
INSERT INTO `t_permission` VALUES ('7fb1dc57d20c85482810722f5f613dc8', '9e97e39161f4ddc595b4bbbe57d7b740', '/manage/article/publish', '文章添加发布', '2', '', '文章添加发布', '212');
INSERT INTO `t_permission` VALUES ('8a75c5aa606d8779ab50a68e0ec8c144', '0fe4353e5ed416347684d32547c5c8a9', '/manage/article/list', '文章列表', '2', '', '文章列表', '221');
INSERT INTO `t_permission` VALUES ('9b3bfb46abeaa6d7bb7bee44466079bf', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/manage/role/role-page', '角色管理', '1', '', '角色管理', '520');
INSERT INTO `t_permission` VALUES ('9df9a5e5795450a82a944a7da5e58d0e', '9b3bfb46abeaa6d7bb7bee44466079bf', '/manage/rolepermission/rp-save', '角色授权接口', '2', '', '角色授权接口', '525');
INSERT INTO `t_permission` VALUES ('9e97e39161f4ddc595b4bbbe57d7b740', 'a707e27f38323471f3e452357287801b', '/manage/article/add-page', '文章新建', '1', '', '文章新建', '210');
INSERT INTO `t_permission` VALUES ('9f8d064ec36da341eb8ef05f7b268a08', '74a179eb95480cc874f527b178ac3d03', '/manage/category/list', '分类列表', '2', '', '分类列表', '234');
INSERT INTO `t_permission` VALUES ('a1b8f6cae5f5390dc391777496aaa020', 'dae7e0793d636fd777af0ac8ef3ac94c', '/manage/special/list', '专题列表', '2', '', '专题列表', '241');
INSERT INTO `t_permission` VALUES ('a707e27f38323471f3e452357287801b', 'root', '/manage/blog', '博客', '0', 'menu-icon fa fa-rss-square', '博客', '200');
INSERT INTO `t_permission` VALUES ('b09fe0458a5f652100c8a1083a1928dd', 'de81bd38bcfb555406326377c076b3c6', '/manage/permission/permission-parent', '权限父节点查询', '2', '', '权限父节点查询', '535');
INSERT INTO `t_permission` VALUES ('b24c6e1fca89b08795c0d58607d00734', '74a179eb95480cc874f527b178ac3d03', '/manage/category/delete', '分类删除', '2', '', '分类删除', '233');
INSERT INTO `t_permission` VALUES ('b5f51641bb5d82900f0bbd55acdb8d2a', 'root', '/manage/systemSetting', '系统', '0', 'menu-icon fa fa-cog', '系统', '500');
INSERT INTO `t_permission` VALUES ('d13263c4fc839257ad4291694718b6ee', '74a179eb95480cc874f527b178ac3d03', '/manage/category/update', '分类编辑', '2', '', '分类编辑', '232');
INSERT INTO `t_permission` VALUES ('d25cfd8dfc1486b788b675f0686859ad', '7ccf03954968a566ec349aca74901267', '/manage/statistics/vistor', '访客统计', '1', '', '访客统计', '110');
INSERT INTO `t_permission` VALUES ('dae7e0793d636fd777af0ac8ef3ac94c', 'a707e27f38323471f3e452357287801b', '/manage/special/page', '专题管理', '1', '', '专题管理', '240');
INSERT INTO `t_permission` VALUES ('de81bd38bcfb555406326377c076b3c6', 'b5f51641bb5d82900f0bbd55acdb8d2a', '/manage/permission/permission-page', '权限管理', '1', '', '权限管理', '530');
INSERT INTO `t_permission` VALUES ('dea0b998caf510f960969e4b56f25036', 'dae7e0793d636fd777af0ac8ef3ac94c', '/manage/special/delete', '专题删除', '2', '', '专题删除', '244');
INSERT INTO `t_permission` VALUES ('debfa912841d8435d8298d5085e6bcfa', '9e97e39161f4ddc595b4bbbe57d7b740', '/manage/article/save', '文章添加', '2', '', '文章添加', '211');
INSERT INTO `t_permission` VALUES ('e03471edfa766ffea25d694d571920b9', '0fe4353e5ed416347684d32547c5c8a9', '/manage/article/update', '文章编辑', '2', '', '文章编辑', '223');
INSERT INTO `t_permission` VALUES ('e862309a22ee6d1768de6bc23c428d20', 'de81bd38bcfb555406326377c076b3c6', '/manage/permission/permission-page-data', '权限列表', '2', '', '权限列表', '531');
INSERT INTO `t_permission` VALUES ('f5a32ad182cd3a684ad66a14b920faae', '9b3bfb46abeaa6d7bb7bee44466079bf', '/manage/role/role-page-data', '角色列表', '2', '', '角色列表', '521');
INSERT INTO `t_permission` VALUES ('ff6e388f00d19dd5eb8be252d6962650', '0fe4353e5ed416347684d32547c5c8a9', '/manage/article/updpublish', '文章编辑发布', '2', '', '文章编辑发布', '225');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名称',
  `description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色描述',
  `sort` int(4) DEFAULT NULL COMMENT '排序',
  `gmt_create` timestamp NULL DEFAULT NULL,
  `gmt_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('0', 'SUPER', '超级管理员', '0', '2019-11-04 10:50:28', '2019-11-04 10:50:32');
INSERT INTO `t_role` VALUES ('1', 'ADMIN', '管理员', '1', '2019-11-04 10:50:40', '2019-11-04 10:50:43');
INSERT INTO `t_role` VALUES ('2', 'USER', '普通用户', '2', '2019-11-04 10:50:34', '2019-11-04 10:50:36');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限表ID',
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色ID',
  `permission_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色权限表';

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('0471031f48bfb44b21f2f9d919627a93', '0', '2de9951792266c1bd1b2de3926ea2558');
INSERT INTO `t_role_permission` VALUES ('053fcabce283a038981107741d3ab38b', '1', 'b24c6e1fca89b08795c0d58607d00734');
INSERT INTO `t_role_permission` VALUES ('0a0a5dacfb436d01767da04c6730a532', '1', 'ff6e388f00d19dd5eb8be252d6962650');
INSERT INTO `t_role_permission` VALUES ('0a62809abd0234907a3a661aa5fbc2b1', '2', '0fe4353e5ed416347684d32547c5c8a9');
INSERT INTO `t_role_permission` VALUES ('0b405d2260b2996f436437c12671aa72', '0', '768482ddabf459b3a6b79360ab4090d2');
INSERT INTO `t_role_permission` VALUES ('10c7c5ffc9d0bd24197d5d3b42b42f56', '2', '8a75c5aa606d8779ab50a68e0ec8c144');
INSERT INTO `t_role_permission` VALUES ('16f7d360d87c461af82b6cfeb07e6155', '0', '1d53173fdd615094ba05de78523275f4');
INSERT INTO `t_role_permission` VALUES ('17e93be2968cc0cfe20d0402e0bd0417', '0', '6fb16af9095202bcfd71ffcb5cebd896');
INSERT INTO `t_role_permission` VALUES ('1b7dc51a7bc5953ade17c1eee959a92e', '0', '1cf4f6eeff19a6fab6eb7fbcaeb1fb46');
INSERT INTO `t_role_permission` VALUES ('1ebd76e013a597ac859878a638b63264', '0', '0e43438893f3b401c360fe7e82b4a3fa');
INSERT INTO `t_role_permission` VALUES ('1f86463093b6f94bdb1f7a683baf8dd1', '2', 'dae7e0793d636fd777af0ac8ef3ac94c');
INSERT INTO `t_role_permission` VALUES ('2280709dfaa81065e6f37f5ec2fb9b10', '2', '74a179eb95480cc874f527b178ac3d03');
INSERT INTO `t_role_permission` VALUES ('22d5613121a3353132f48034208dbbd5', '1', '9f8d064ec36da341eb8ef05f7b268a08');
INSERT INTO `t_role_permission` VALUES ('278994863ed9e2db20c4d36f778b36da', '0', '9e97e39161f4ddc595b4bbbe57d7b740');
INSERT INTO `t_role_permission` VALUES ('2aa14002830ef99985c87bb023812677', '0', 'f5a32ad182cd3a684ad66a14b920faae');
INSERT INTO `t_role_permission` VALUES ('2b27364a76937f4e24c2af131315eb66', '0', '9b3bfb46abeaa6d7bb7bee44466079bf');
INSERT INTO `t_role_permission` VALUES ('2c0c2325aa7e0739e0cbbe368cfeaf62', '0', '565b9d7371a36099fc598fbf24709fc2');
INSERT INTO `t_role_permission` VALUES ('2c1b48ec9d82b6b95d5b90f320d37309', '0', 'ff6e388f00d19dd5eb8be252d6962650');
INSERT INTO `t_role_permission` VALUES ('30af8e88e24ad30657e0d8203e664db6', '0', '68e2797df196555f696e5469ceb05cca');
INSERT INTO `t_role_permission` VALUES ('346d8371262fa256687c66f37725c0b7', '1', '2de9951792266c1bd1b2de3926ea2558');
INSERT INTO `t_role_permission` VALUES ('3575d5acf72f945be3451901a21f0ded', '0', 'de81bd38bcfb555406326377c076b3c6');
INSERT INTO `t_role_permission` VALUES ('367d55f34aad6ce2c27fd81391cc62fb', '2', '43d5de55a83f1a6b1f5e38637d4bb26a');
INSERT INTO `t_role_permission` VALUES ('3f9aa19ab2840f7599f4485ce0de7b33', '1', '42337d91507df7cb8e6f926ca22df265');
INSERT INTO `t_role_permission` VALUES ('459f26e4cddb57b7db024151ea86d1d4', '0', '8a75c5aa606d8779ab50a68e0ec8c144');
INSERT INTO `t_role_permission` VALUES ('45cbbff38a5542472fdcb64c721d9535', '1', 'dea0b998caf510f960969e4b56f25036');
INSERT INTO `t_role_permission` VALUES ('4e8149fac56c9c3b9c1bf84ee1365cdb', '2', '9e97e39161f4ddc595b4bbbe57d7b740');
INSERT INTO `t_role_permission` VALUES ('4ebaed2977c30f821177c710c6eda45e', '1', '59e5135bff5e75051a0cc100bc9a641e');
INSERT INTO `t_role_permission` VALUES ('4ef882d66544170dba1d4f5bd18cf817', '2', 'e03471edfa766ffea25d694d571920b9');
INSERT INTO `t_role_permission` VALUES ('50db99da50b24778b28b02a389924864', '1', '0fe4353e5ed416347684d32547c5c8a9');
INSERT INTO `t_role_permission` VALUES ('552d20a8330b09bdf5f59bd585022766', '2', '59e5135bff5e75051a0cc100bc9a641e');
INSERT INTO `t_role_permission` VALUES ('57f2e5f1617f7b06ccde9b8039a63a8e', '1', 'debfa912841d8435d8298d5085e6bcfa');
INSERT INTO `t_role_permission` VALUES ('597b9175d876596ebe242d42512a8268', '2', 'a1b8f6cae5f5390dc391777496aaa020');
INSERT INTO `t_role_permission` VALUES ('5c2e8b9218cf352edc65451a1926b88a', '0', '7f37a751181aa8cd019b4663e197a11d');
INSERT INTO `t_role_permission` VALUES ('60ee2060d369121246865001ec9d23eb', '2', '4ee0989e3a2eb3367f41d888d810ba63');
INSERT INTO `t_role_permission` VALUES ('62bcf3fc7e42dd26198bdd5647bd22d9', '2', 'b24c6e1fca89b08795c0d58607d00734');
INSERT INTO `t_role_permission` VALUES ('672817515c100377764feb6071aa0811', '0', '0fe4353e5ed416347684d32547c5c8a9');
INSERT INTO `t_role_permission` VALUES ('6b0c060a7ddb85a3c4afbec6be0fd827', '2', '7e3376cf746e0eacb7761342cec95198');
INSERT INTO `t_role_permission` VALUES ('6b472be94b4379c24e0e8637109a234c', '2', 'd13263c4fc839257ad4291694718b6ee');
INSERT INTO `t_role_permission` VALUES ('6bb9c1112885f9e5af4a1bc07d180049', '1', 'dae7e0793d636fd777af0ac8ef3ac94c');
INSERT INTO `t_role_permission` VALUES ('6d37eaa930cd4919ffe25b7349036404', '2', '9f8d064ec36da341eb8ef05f7b268a08');
INSERT INTO `t_role_permission` VALUES ('72308d21f05b32330b9c08d1376a3036', '1', '1cf4f6eeff19a6fab6eb7fbcaeb1fb46');
INSERT INTO `t_role_permission` VALUES ('742623a422887424946cfb34d5a4c95c', '1', 'd13263c4fc839257ad4291694718b6ee');
INSERT INTO `t_role_permission` VALUES ('74962bb260a7a2b230a076b66dfaa4a1', '0', 'dae7e0793d636fd777af0ac8ef3ac94c');
INSERT INTO `t_role_permission` VALUES ('750f2ffbe9396562ede749729d8e48fb', '0', '9df9a5e5795450a82a944a7da5e58d0e');
INSERT INTO `t_role_permission` VALUES ('75f6d7c86220442312f691cae0df3ff0', '0', '4a119b964f283aeee15ad68fc43c0ceb');
INSERT INTO `t_role_permission` VALUES ('785728cc1498a2b87ffd6f4e6179fb05', '0', '7fb1dc57d20c85482810722f5f613dc8');
INSERT INTO `t_role_permission` VALUES ('7fbd9874d92e50fda7c7657c0c403851', '1', '68e2797df196555f696e5469ceb05cca');
INSERT INTO `t_role_permission` VALUES ('862ea8eb8ab4a4d16505ac22d1e5667c', '1', '4a119b964f283aeee15ad68fc43c0ceb');
INSERT INTO `t_role_permission` VALUES ('87cacdbd1573a75ba30c8a76b8fdce7e', '2', 'debfa912841d8435d8298d5085e6bcfa');
INSERT INTO `t_role_permission` VALUES ('888b5d658957cbca4942ea64c1402b3b', '0', 'd25cfd8dfc1486b788b675f0686859ad');
INSERT INTO `t_role_permission` VALUES ('8b37ca9728908fa5026f9c6d2719fb77', '2', 'd25cfd8dfc1486b788b675f0686859ad');
INSERT INTO `t_role_permission` VALUES ('8e226ab23e2ca0bd2511b697c09bd8cd', '1', 'a1b8f6cae5f5390dc391777496aaa020');
INSERT INTO `t_role_permission` VALUES ('92da5bafca8c704e8813e3ca74f46f3b', '0', '7e3376cf746e0eacb7761342cec95198');
INSERT INTO `t_role_permission` VALUES ('96d9d404a2f63692a81e595e8d8c173a', '0', 'e862309a22ee6d1768de6bc23c428d20');
INSERT INTO `t_role_permission` VALUES ('9d0d5a4438542cde4bf1674f4a9b90b8', '1', '9e97e39161f4ddc595b4bbbe57d7b740');
INSERT INTO `t_role_permission` VALUES ('9eb531da811776eebeffa49bbd124e7b', '0', '00afe8f2689424796a0a45f431f548ec');
INSERT INTO `t_role_permission` VALUES ('aa1ccb5e872ad1fad14ae2fbdd18fea1', '1', '74a179eb95480cc874f527b178ac3d03');
INSERT INTO `t_role_permission` VALUES ('abdea6bf2e2f96c2fdf9553f00787714', '0', '760228cfeab3640219deae51cc3b0b69');
INSERT INTO `t_role_permission` VALUES ('ad51d3497648960674a85fe98386dc5b', '0', 'b09fe0458a5f652100c8a1083a1928dd');
INSERT INTO `t_role_permission` VALUES ('adb82cf6dcb3df063cb032963df5c259', '0', '9f8d064ec36da341eb8ef05f7b268a08');
INSERT INTO `t_role_permission` VALUES ('b08134e9953dbefec74b4fb2d45727f0', '0', 'dea0b998caf510f960969e4b56f25036');
INSERT INTO `t_role_permission` VALUES ('b11ac72b35c4c3cadde056e8c36d69fc', '0', 'd13263c4fc839257ad4291694718b6ee');
INSERT INTO `t_role_permission` VALUES ('b725d87146ad366c84010e48c9791282', '2', '68e2797df196555f696e5469ceb05cca');
INSERT INTO `t_role_permission` VALUES ('c6863a3ddab0a7c752bc3fb2ff3a28d3', '0', '3fcfb38b748a71d5de9192bb8ad1608d');
INSERT INTO `t_role_permission` VALUES ('c6d8ce012e7e44cf48ea002bc0cdb469', '0', 'e03471edfa766ffea25d694d571920b9');
INSERT INTO `t_role_permission` VALUES ('c8147111a879658cfc9e2537c0b98600', '1', '43d5de55a83f1a6b1f5e38637d4bb26a');
INSERT INTO `t_role_permission` VALUES ('ca72edb69b5b946eabeeee24371a3ea0', '1', '1d53173fdd615094ba05de78523275f4');
INSERT INTO `t_role_permission` VALUES ('d2ab9a9765e62bb36ec1794e71d41ba1', '0', '74a179eb95480cc874f527b178ac3d03');
INSERT INTO `t_role_permission` VALUES ('d433870c350e227f1e48f9360905ab50', '2', 'dea0b998caf510f960969e4b56f25036');
INSERT INTO `t_role_permission` VALUES ('dab1bef67cd9ea4ffdb691c6c4b8a39c', '2', 'ff6e388f00d19dd5eb8be252d6962650');
INSERT INTO `t_role_permission` VALUES ('dad1949657459079a0d6f7cced936b84', '2', '7fb1dc57d20c85482810722f5f613dc8');
INSERT INTO `t_role_permission` VALUES ('deb77fee8ae160426b6a15cd25628e55', '0', 'b24c6e1fca89b08795c0d58607d00734');
INSERT INTO `t_role_permission` VALUES ('e09de1a0b581005972d7a12c8de2d5d3', '1', '4ee0989e3a2eb3367f41d888d810ba63');
INSERT INTO `t_role_permission` VALUES ('e11100758b7d4f92db2ddf85a0719769', '0', 'a1b8f6cae5f5390dc391777496aaa020');
INSERT INTO `t_role_permission` VALUES ('e2303d56933872fa2e414a5024262749', '1', '8a75c5aa606d8779ab50a68e0ec8c144');
INSERT INTO `t_role_permission` VALUES ('e5184bdc9bdbcd450e007bc7f9ccaa6e', '0', '59e5135bff5e75051a0cc100bc9a641e');
INSERT INTO `t_role_permission` VALUES ('e5e7ec0298a2e08bb670baccc7c002a1', '1', 'd25cfd8dfc1486b788b675f0686859ad');
INSERT INTO `t_role_permission` VALUES ('ec78a12f629173c2d9130cbc11fe2ddc', '0', '43d5de55a83f1a6b1f5e38637d4bb26a');
INSERT INTO `t_role_permission` VALUES ('ed9ff56ebde5fdcd9e923c07d381f8a7', '1', '0e43438893f3b401c360fe7e82b4a3fa');
INSERT INTO `t_role_permission` VALUES ('f078d4451f7e7a52c1ff9e2836e73c11', '0', 'debfa912841d8435d8298d5085e6bcfa');
INSERT INTO `t_role_permission` VALUES ('f0aad9b5a029d38a00a2104c903a71d2', '1', '768482ddabf459b3a6b79360ab4090d2');
INSERT INTO `t_role_permission` VALUES ('f16fd4733708321b4b758ee8b00ec8aa', '0', '42337d91507df7cb8e6f926ca22df265');
INSERT INTO `t_role_permission` VALUES ('f1988a7b586755f0d1d84f76e7d6f028', '1', '7fb1dc57d20c85482810722f5f613dc8');
INSERT INTO `t_role_permission` VALUES ('f3af11e22a64b4079b81265ca47142f2', '0', '4ee0989e3a2eb3367f41d888d810ba63');
INSERT INTO `t_role_permission` VALUES ('f6925722f136c73b74d75ba7c553765c', '1', '7e3376cf746e0eacb7761342cec95198');
INSERT INTO `t_role_permission` VALUES ('f7ab8e9284e74d94b3362edf0ee47893', '2', '1d53173fdd615094ba05de78523275f4');
INSERT INTO `t_role_permission` VALUES ('f95bcf36fdc72f0a79a95b7960e34563', '2', '4a119b964f283aeee15ad68fc43c0ceb');
INSERT INTO `t_role_permission` VALUES ('ff835b0adec0e01235978feeb9829dcf', '1', 'e03471edfa766ffea25d694d571920b9');

-- ----------------------------
-- Table structure for t_special
-- ----------------------------
DROP TABLE IF EXISTS `t_special`;
CREATE TABLE `t_special` (
  `id` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sort` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_special
-- ----------------------------
INSERT INTO `t_special` VALUES ('CMDmAmAL', '客户数量的话说的就是副驾驶的胜多负少所发生的呢', '客户数量的话说的就是副驾驶的胜多负少所发生的呢', 'http://localhost:8080/s/CMDmAmAL', '4');
INSERT INTO `t_special` VALUES ('LXnhk4zT', '爱上擦擦十大撒大大三十多万', '爱上擦擦十大撒大大三十多万', 'http://localhost:8080/s/LXnhk4zT', '3');
INSERT INTO `t_special` VALUES ('S5mpJxri', '猴子也能懂得专题', '猴子也能懂得专题', 'http://localhost:8080/s/S5mpJxri', '2');
INSERT INTO `t_special` VALUES ('Uv9vwKdO', 'springboot', 'springboot', 'http://localhost:8080/s/Uv9vwKdO', '1');

-- ----------------------------
-- Table structure for t_special_article
-- ----------------------------
DROP TABLE IF EXISTS `t_special_article`;
CREATE TABLE `t_special_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `special_id` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `article_id` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_special_article
-- ----------------------------
INSERT INTO `t_special_article` VALUES ('4', 'S5mpJxri', '1911TteflNXd');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '昵称',
  `photo` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `gender` int(2) DEFAULT NULL COMMENT '性别',
  `information` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '简介',
  `status` int(2) DEFAULT NULL COMMENT '状态 1正常，2冻结，9删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('0', 'super', '$2a$10$IbFU7vRzexKkqGG2J630AOBGpq6C6PgsNqHuaefz.ObYHnttgkzgu', '超级管理员', '111', '111', '1', '111', '1');
INSERT INTO `t_user` VALUES ('0b903557b60b5ac50162c564db766c0f', 'gaosheng', '$2a$10$PWhTjIF3XGQ3HXZvWJz0BeryJY505O6c0UU/X0QPGPMwS/lUT.6V6', '程序员的幻想乡', null, '', '2', '程序员的幻想乡', '1');
INSERT INTO `t_user` VALUES ('310ebbb298f0f788f30783efb343ad02', 'admin', '$2a$10$tAyaw8Me5kHuDUwSXy/gg.M20ctlRr8vhVet2Nc.X2K/Gv077B33q', '管理员', null, '111', '0', '管理员', '1');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` bigint(11) NOT NULL COMMENT '用户角色表ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户ID',
  `role_id` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户角色表';

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '0', '0');
INSERT INTO `t_user_role` VALUES ('2', '310ebbb298f0f788f30783efb343ad02', '1');

-- ----------------------------
-- Table structure for t_vistor_log
-- ----------------------------
DROP TABLE IF EXISTS `t_vistor_log`;
CREATE TABLE `t_vistor_log` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` int(4) DEFAULT NULL COMMENT '类型',
  `content_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '被访内容ID',
  `vistor_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '访问链接',
  `vistor_ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '来访IP',
  `vistor_time` datetime DEFAULT NULL COMMENT '来访时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_vistor_log
-- ----------------------------
INSERT INTO `t_vistor_log` VALUES ('04134b9349bb0b39d25a7ad25721bf91', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-14 12:36:03');
INSERT INTO `t_vistor_log` VALUES ('064552ffb89aa05e8b504aece75d6fd6', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:33:44');
INSERT INTO `t_vistor_log` VALUES ('07ca7de802da8b0157eb20b1616b73c4', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 06:34:39');
INSERT INTO `t_vistor_log` VALUES ('087920a7bdd82025a7965d0f17376c4e', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 06:50:28');
INSERT INTO `t_vistor_log` VALUES ('09f56a5c2e57495626a89de55e179f81', null, null, 'http://localhost:8080/s/Uv9vwKdO/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:53:53');
INSERT INTO `t_vistor_log` VALUES ('0ba2de6662c173a21c27eb0beba4538e', null, null, 'http://localhost:8080/c/o96Gl3x6/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:53:58');
INSERT INTO `t_vistor_log` VALUES ('0da65df9331d50cd6d3f2abfc8b5c743', null, null, 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '2019-11-16 06:27:15');
INSERT INTO `t_vistor_log` VALUES ('0f6dd70898635b6a7163730ed3ab036c', '4', '191178nx7z2K', 'http://localhost:8080/a/191178nx7z2K', '0:0:0:0:0:0:0:1', '2019-11-14 12:24:31');
INSERT INTO `t_vistor_log` VALUES ('10bd4a0a1d87ed0050f231e4984b2183', null, null, 'http://localhost:8080/s/CMDmAmAL/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:52:24');
INSERT INTO `t_vistor_log` VALUES ('11b727b97f76b338807eb48fc0aaec9f', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 06:52:12');
INSERT INTO `t_vistor_log` VALUES ('139f32acb737758863f6fa8ecaea0d44', '4', '191178nx7z2K', 'http://localhost:8080/a/191178nx7z2K', '0:0:0:0:0:0:0:1', '2019-11-14 12:25:42');
INSERT INTO `t_vistor_log` VALUES ('13e31d4799062b2458133983d6a6d749', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:32:49');
INSERT INTO `t_vistor_log` VALUES ('1550b1ca3a64045d1ecf0dc806f4c5bf', null, null, 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '2019-11-16 05:48:31');
INSERT INTO `t_vistor_log` VALUES ('15c579914dccf1275def59015e1547d1', null, null, 'http://localhost:8080/c/P80LEK7c/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:54:00');
INSERT INTO `t_vistor_log` VALUES ('1927065080fdbecb849683fe8234baa0', null, null, 'http://localhost:8080/s/Uv9vwKdO/1', '0:0:0:0:0:0:0:1', '2019-11-16 07:40:51');
INSERT INTO `t_vistor_log` VALUES ('198cb39cef7f6b87ad78c2cfd74f796f', '4', '1911TteflNXd', 'http://localhost:8080/a/1911TteflNXd', '0:0:0:0:0:0:0:1', '2019-11-16 06:52:56');
INSERT INTO `t_vistor_log` VALUES ('1abb50536fe46cdfdf100b214ca7bf94', '4', '1911x3mugPKI', 'http://localhost:8080/a/1911x3mugPKI', '0:0:0:0:0:0:0:1', '2019-11-14 13:17:11');
INSERT INTO `t_vistor_log` VALUES ('1bfd10673c9a526c2ed3b656dc876420', null, null, 'http://localhost:8080/c/5K9fOoKZ/1', '0:0:0:0:0:0:0:1', '2019-11-16 05:59:10');
INSERT INTO `t_vistor_log` VALUES ('1fcdc50aae3bdd3feb8b40ea8e8e051e', null, null, 'http://localhost:8080/s/CMDmAmAL/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:53:52');
INSERT INTO `t_vistor_log` VALUES ('1ffee2f422fb14f9d04f233467bdf076', null, null, 'http://localhost:8080/s/S5mpJxri/1', '0:0:0:0:0:0:0:1', '2019-11-16 07:40:44');
INSERT INTO `t_vistor_log` VALUES ('21178f12e237bdea2bb5464ddfbdf760', null, null, 'http://localhost:8080/s/Uv9vwKdO/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:52:30');
INSERT INTO `t_vistor_log` VALUES ('2e9245abf624a230e6f2dd38d838430a', null, null, 'http://localhost:8080/s/S5mpJxri/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:53:49');
INSERT INTO `t_vistor_log` VALUES ('2fb4d2abdce02c7e0239f1b5073484db', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:34:33');
INSERT INTO `t_vistor_log` VALUES ('3b4d7a5f843e2a17718e19f74636961e', null, null, 'http://localhost:8080/s/LXnhk4zT/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:52:21');
INSERT INTO `t_vistor_log` VALUES ('3f27bd1b22dda9418193dd6517496500', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-16 05:59:05');
INSERT INTO `t_vistor_log` VALUES ('41c0b7ebbe87613b31cc1aab391e5132', null, null, 'http://localhost:8080/c/jwSII7MM/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:54:01');
INSERT INTO `t_vistor_log` VALUES ('41ecf6d6c616814dca936079328fe53a', '4', '191169XV1IGh', 'http://localhost:8080/a/191169XV1IGh', '0:0:0:0:0:0:0:1', '2019-11-14 13:17:16');
INSERT INTO `t_vistor_log` VALUES ('4339e49145cc5ae974172f103a426223', '4', '191178nx7z2K', 'http://localhost:8080/a/191178nx7z2K', '0:0:0:0:0:0:0:1', '2019-11-16 06:00:17');
INSERT INTO `t_vistor_log` VALUES ('45b7106b69de6e182404575bb266c797', null, null, 'http://localhost:8080/c/jwSII7MM/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:34:49');
INSERT INTO `t_vistor_log` VALUES ('464d9077332b00adddd3d28bfd2914e4', null, null, 'http://localhost:8080/c/jwSII7MM/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:48:28');
INSERT INTO `t_vistor_log` VALUES ('48b5c11a265ca0e2b72644ff18b461e5', null, null, 'http://localhost:8080/s/S5mpJxri/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:53:02');
INSERT INTO `t_vistor_log` VALUES ('49526c977deb57c137add46b5a101d75', null, null, 'http://localhost:8080/c/P80LEK7c/1', '0:0:0:0:0:0:0:1', '2019-11-16 05:59:09');
INSERT INTO `t_vistor_log` VALUES ('4b97d49a1326becdd528cb95b52aa562', null, null, 'http://localhost:8080/s/LXnhk4zT/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:53:51');
INSERT INTO `t_vistor_log` VALUES ('4c69a848f42bddd33fc9236fb07a39f8', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 06:34:36');
INSERT INTO `t_vistor_log` VALUES ('4e485915913949e7428f291258730dfc', null, null, 'http://localhost:8080/s/Uv9vwKdO/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:53:00');
INSERT INTO `t_vistor_log` VALUES ('501a5322e2ff539b42281c1a317b3d25', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-14 12:24:28');
INSERT INTO `t_vistor_log` VALUES ('503133ac9fbcce07557cac5f1bf9d8b4', null, null, 'http://localhost:8080/c/jwSII7MM/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:34:40');
INSERT INTO `t_vistor_log` VALUES ('50ea3d1e54e4780500ddf348bceac130', null, null, 'http://localhost:8080/c/o96Gl3x6/1', '0:0:0:0:0:0:0:1', '2019-11-16 05:59:03');
INSERT INTO `t_vistor_log` VALUES ('551b7f52e5a285380f57c671823c35ee', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-16 05:59:07');
INSERT INTO `t_vistor_log` VALUES ('584156e4e490ce06c70402ca131d2d5e', null, null, 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '2019-11-16 05:48:30');
INSERT INTO `t_vistor_log` VALUES ('5916a24a78b80e43d6bec072b06d0cb3', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 06:32:47');
INSERT INTO `t_vistor_log` VALUES ('59f5746d75f44c536452864c5440d5ea', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-16 07:40:45');
INSERT INTO `t_vistor_log` VALUES ('5b75fa4333bc63ef11fa46495857df9f', null, null, 'http://localhost:8080/s/S5mpJxri/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:52:23');
INSERT INTO `t_vistor_log` VALUES ('5b7d0b01a228d51c33c7a7bc7a399266', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 06:50:30');
INSERT INTO `t_vistor_log` VALUES ('5f9ae2f33633db1a5552e42fbdfa668b', null, null, 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '2019-11-16 05:48:33');
INSERT INTO `t_vistor_log` VALUES ('628a459ed08798fab964282a8921d3b6', '4', '1911x3mugPKI', 'http://localhost:8080/a/1911x3mugPKI', '0:0:0:0:0:0:0:1', '2019-11-14 13:17:14');
INSERT INTO `t_vistor_log` VALUES ('660aea6c4a09f177756fef7ce3803629', null, null, 'http://localhost:8080/s/Uv9vwKdO/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:52:33');
INSERT INTO `t_vistor_log` VALUES ('6bad3a64cf3d3eea44dac228aa60110b', null, null, 'http://localhost:8080/s/S5mpJxri/1', '0:0:0:0:0:0:0:1', '2019-11-16 07:40:39');
INSERT INTO `t_vistor_log` VALUES ('6cca6e1c1a17872a127039579278d9fd', null, null, 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '2019-11-16 07:39:58');
INSERT INTO `t_vistor_log` VALUES ('7013afa4e4deb910331eb5f6a901323d', null, null, 'http://localhost:8080/c/o96Gl3x6/1', '0:0:0:0:0:0:0:1', '2019-11-16 05:59:09');
INSERT INTO `t_vistor_log` VALUES ('72863ca5ec616164f292673972444ba8', null, null, 'http://localhost:8080/c/jwSII7MM/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:53:56');
INSERT INTO `t_vistor_log` VALUES ('72dba9ccd9d7a0e0dab6a625124d031e', null, null, 'http://localhost:8080/s/Uv9vwKdO/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:52:31');
INSERT INTO `t_vistor_log` VALUES ('760f728e35fedeaaa46b3bfbd62df0d5', null, null, 'http://localhost:8080/c/5K9fOoKZ/1', '0:0:0:0:0:0:0:1', '2019-11-14 12:35:59');
INSERT INTO `t_vistor_log` VALUES ('77e6717a3ead002a5866b96c49a941e8', null, null, 'http://localhost:8080/s/S5mpJxri/1', '0:0:0:0:0:0:0:1', '2019-11-16 07:40:54');
INSERT INTO `t_vistor_log` VALUES ('7bb25a963d0275a4f25b5241d588a49c', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:34:38');
INSERT INTO `t_vistor_log` VALUES ('7dd7a6291d7f428bca3d05bd7f31a48d', null, null, 'http://localhost:8080/c/jwSII7MM/1', '0:0:0:0:0:0:0:1', '2019-11-16 05:59:04');
INSERT INTO `t_vistor_log` VALUES ('804c1a63f5597276c0b693bbdc91d8ae', null, null, 'http://localhost:8080/c/jwSII7MM/1', '0:0:0:0:0:0:0:1', '2019-11-16 05:59:08');
INSERT INTO `t_vistor_log` VALUES ('87b77b33f14908021de3b47e851cc905', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-14 12:24:55');
INSERT INTO `t_vistor_log` VALUES ('8942ea5712befdf528aa923ec88c7ced', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-16 07:41:12');
INSERT INTO `t_vistor_log` VALUES ('89b152e6a28b786f1e4c852eaea97a42', '4', '191178nx7z2K', 'http://localhost:8080/a/191178nx7z2K', '0:0:0:0:0:0:0:1', '2019-11-14 13:12:55');
INSERT INTO `t_vistor_log` VALUES ('8c111d4cbd3770659890e138a22e55d4', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-16 05:59:15');
INSERT INTO `t_vistor_log` VALUES ('8c8157821301326215dae16886b5308a', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-14 12:24:46');
INSERT INTO `t_vistor_log` VALUES ('8e41e8b973b87f521a31270b7d01079f', '4', '191178nx7z2K', 'http://localhost:8080/a/191178nx7z2K', '0:0:0:0:0:0:0:1', '2019-11-16 06:54:30');
INSERT INTO `t_vistor_log` VALUES ('8e595525098af31a3ba9b08da82ae5db', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 06:52:09');
INSERT INTO `t_vistor_log` VALUES ('8e97e6f5cf36ce4baa47ce819ef33a09', '4', '1911x3mugPKI', 'http://localhost:8080/a/1911x3mugPKI', '0:0:0:0:0:0:0:1', '2019-11-14 13:17:09');
INSERT INTO `t_vistor_log` VALUES ('90434b990163dc4a3f1e32137cbfbbaf', '4', '1911x3mugPKI', 'http://localhost:8080/a/1911x3mugPKI', '0:0:0:0:0:0:0:1', '2019-11-16 05:58:37');
INSERT INTO `t_vistor_log` VALUES ('90e38aa5c9999efe5a629d8a71ff5587', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-14 12:35:04');
INSERT INTO `t_vistor_log` VALUES ('91d2e0c4fdad31c0eda92de53eb004cc', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 06:27:17');
INSERT INTO `t_vistor_log` VALUES ('925eb90f1249f999b72ac290fd90932a', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:54:01');
INSERT INTO `t_vistor_log` VALUES ('9317f9e1cab59b6c65e735855754468b', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 05:59:15');
INSERT INTO `t_vistor_log` VALUES ('93c5f4c34c33f578c29cc07900863e87', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 07:40:37');
INSERT INTO `t_vistor_log` VALUES ('93ebd02ae9365f77be19145b971018fc', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 06:32:26');
INSERT INTO `t_vistor_log` VALUES ('94d41c47d8f8797fecb300ed0cfa2678', null, null, 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '2019-11-16 05:48:27');
INSERT INTO `t_vistor_log` VALUES ('951d4a05c93d5b197250f181f2bcd259', null, null, 'http://localhost:8080/s/LXnhk4zT/1', '0:0:0:0:0:0:0:1', '2019-11-16 07:40:49');
INSERT INTO `t_vistor_log` VALUES ('966f691ed18eb7d5f1483a5e6a7e5c6b', null, null, 'http://localhost:8080/s/Uv9vwKdO/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:52:28');
INSERT INTO `t_vistor_log` VALUES ('97da521a5a8d9e83693568baa109edd6', '4', '1911x3mugPKI', 'http://localhost:8080/a/1911x3mugPKI', '0:0:0:0:0:0:0:1', '2019-11-16 07:40:09');
INSERT INTO `t_vistor_log` VALUES ('9a18bb16a8e745789b7ab3011f50cc75', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-14 12:26:45');
INSERT INTO `t_vistor_log` VALUES ('9af9c8fad75ae8a51d92079cdc9e2787', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 06:48:29');
INSERT INTO `t_vistor_log` VALUES ('9be17e772f48c26d7867edfa7335c539', null, null, 'http://localhost:8080/c/P80LEK7c/1', '0:0:0:0:0:0:0:1', '2019-11-14 12:24:52');
INSERT INTO `t_vistor_log` VALUES ('9c36776680ff23cb9fb6630850f635ca', null, null, 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '2019-11-16 05:53:30');
INSERT INTO `t_vistor_log` VALUES ('9fac4de57ca3cd2b2f69729e7f52fd52', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:48:48');
INSERT INTO `t_vistor_log` VALUES ('9fe9bf1b6dfbff90f7d4ae396057a42d', null, null, 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '2019-11-16 07:39:54');
INSERT INTO `t_vistor_log` VALUES ('9ffd87d4c84668f994532f7102d547b6', null, null, 'http://localhost:8080/s/CMDmAmAL/1', '0:0:0:0:0:0:0:1', '2019-11-16 07:40:46');
INSERT INTO `t_vistor_log` VALUES ('a008400d06fe17c81df5888a7f7ff6b8', null, null, 'http://localhost:8080/c/P80LEK7c/1', '0:0:0:0:0:0:0:1', '2019-11-16 05:59:04');
INSERT INTO `t_vistor_log` VALUES ('a0534a9ab44bf908e22cd93bdc00de10', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 05:55:13');
INSERT INTO `t_vistor_log` VALUES ('a3ffb669db2764ac832fef0f4bb0e8f5', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:33:40');
INSERT INTO `t_vistor_log` VALUES ('a52d4ee6ca2fea7904572f1e8e3218ed', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-14 13:12:21');
INSERT INTO `t_vistor_log` VALUES ('ab7178133015721d82a311a7e88619bf', null, null, 'http://localhost:8080/c/jwSII7MM/1', '0:0:0:0:0:0:0:1', '2019-11-14 12:24:49');
INSERT INTO `t_vistor_log` VALUES ('b015983328314e2e2ee4d66bd12eedc1', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 06:00:22');
INSERT INTO `t_vistor_log` VALUES ('b07b6863774b9ba1ad1e8b4cb6ce58bf', null, null, 'http://localhost:8080/s/S5mpJxri/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:52:14');
INSERT INTO `t_vistor_log` VALUES ('b15481962ddf5b12a89b35da1e173f87', null, null, 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '2019-11-16 05:48:31');
INSERT INTO `t_vistor_log` VALUES ('b260d8a44e1de597d97d7f0037b2fae0', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:34:35');
INSERT INTO `t_vistor_log` VALUES ('b2e5a734f33d64f9fd9dbf33b19fcdbc', null, null, 'http://localhost:8080/s/Uv9vwKdO/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:52:47');
INSERT INTO `t_vistor_log` VALUES ('b361fb217405cc0c40e8ad6b66b40c0a', '4', '1911x3mugPKI', 'http://localhost:8080/a/1911x3mugPKI', '0:0:0:0:0:0:0:1', '2019-11-16 07:40:03');
INSERT INTO `t_vistor_log` VALUES ('b3b6344982fa9fdc4c337fe337e9d6e0', null, null, 'http://localhost:8080/c/5K9fOoKZ/1', '0:0:0:0:0:0:0:1', '2019-11-16 05:59:01');
INSERT INTO `t_vistor_log` VALUES ('b482749778023036bae40a7838592105', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-14 12:36:01');
INSERT INTO `t_vistor_log` VALUES ('b4b7f2f0dd270deb3dcb5f926c754ede', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 05:53:32');
INSERT INTO `t_vistor_log` VALUES ('b7fbddd8766980806f4179af99471968', null, null, 'http://localhost:8080/c/5K9fOoKZ/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:53:59');
INSERT INTO `t_vistor_log` VALUES ('b95f1efc9449d722612988b9fc76dc89', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-14 12:36:01');
INSERT INTO `t_vistor_log` VALUES ('b966e7d761a3024decf01866b0345f91', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-16 05:59:12');
INSERT INTO `t_vistor_log` VALUES ('ba42e3268a6233ddb8e921bd8a8f3c69', null, null, 'http://localhost:8080/c/jwSII7MM/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:48:31');
INSERT INTO `t_vistor_log` VALUES ('baab62e8bd1cae4d8420809e2107221f', '4', '191178nx7z2K', 'http://localhost:8080/a/191178nx7z2K', '0:0:0:0:0:0:0:1', '2019-11-14 12:26:37');
INSERT INTO `t_vistor_log` VALUES ('c02220bc8ee94ab299517901c2bc709d', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 06:53:54');
INSERT INTO `t_vistor_log` VALUES ('c02b77f085acebbec968fd0d11e76a13', null, null, 'http://localhost:8080/c/P80LEK7c/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:53:57');
INSERT INTO `t_vistor_log` VALUES ('c0f96b18683fac7f7fff8bc6e8ca7e1a', null, null, 'http://localhost:8080/s/Uv9vwKdO/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:52:19');
INSERT INTO `t_vistor_log` VALUES ('c1d13e9707fa19e074a71c8ba8b88772', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 06:27:11');
INSERT INTO `t_vistor_log` VALUES ('c3515a5c34efaa3f75e6a0524695ba4c', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:34:31');
INSERT INTO `t_vistor_log` VALUES ('c40c905d956d302e2737554d1b24b1d1', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-14 13:12:58');
INSERT INTO `t_vistor_log` VALUES ('c40da8275eb61a8c47a0f549434becc4', null, null, 'http://localhost:8080/s/Uv9vwKdO/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:52:26');
INSERT INTO `t_vistor_log` VALUES ('c59fbed9c8724f51eb9054c96c6c8f9c', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:53:55');
INSERT INTO `t_vistor_log` VALUES ('c9216f8a7fa77293702628ca494b148a', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 05:59:11');
INSERT INTO `t_vistor_log` VALUES ('cbee403588b104f6ba9f73dc18f11121', '4', '1911lG1TdjMz', 'http://localhost:8080/a/1911lG1TdjMz', '0:0:0:0:0:0:0:1', '2019-11-16 06:55:50');
INSERT INTO `t_vistor_log` VALUES ('ce1915409fc1e8734097c3a3bc211441', '4', '1911x3mugPKI', 'http://localhost:8080/a/1911x3mugPKI', '0:0:0:0:0:0:0:1', '2019-11-16 05:58:02');
INSERT INTO `t_vistor_log` VALUES ('d04b275b5e5dd3206dc4468d65eb0158', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 06:54:34');
INSERT INTO `t_vistor_log` VALUES ('d08fc174ae8709c09573ce7072fe3e35', null, null, 'http://localhost:8080/s/CMDmAmAL/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:55:56');
INSERT INTO `t_vistor_log` VALUES ('d23ab58807ce22ec4c6ffa13249b8987', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 05:44:50');
INSERT INTO `t_vistor_log` VALUES ('d83dac2a77c6d247454c418a53d7d38b', '4', '1911TteflNXd', 'http://localhost:8080/a/1911TteflNXd', '0:0:0:0:0:0:0:1', '2019-11-16 07:40:41');
INSERT INTO `t_vistor_log` VALUES ('daff9ba7eae7d607a53f8b565fd89f51', '4', '1911x3mugPKI', 'http://localhost:8080/a/1911x3mugPKI', '0:0:0:0:0:0:0:1', '2019-11-16 06:55:54');
INSERT INTO `t_vistor_log` VALUES ('dd330d8a0d1f74a746239aaece2db32f', null, null, 'http://localhost:8080/c/6GLlV2Eu/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:48:42');
INSERT INTO `t_vistor_log` VALUES ('ddcdcd51091240920cfe59038fb674e8', null, null, 'http://localhost:8080/c/jwSII7MM/1', '0:0:0:0:0:0:0:1', '2019-11-14 12:36:00');
INSERT INTO `t_vistor_log` VALUES ('e005228b41ff99fa43d8f64bc3afc408', '4', '1911x3mugPKI', 'http://localhost:8080/a/1911x3mugPKI', '0:0:0:0:0:0:0:1', '2019-11-16 06:55:45');
INSERT INTO `t_vistor_log` VALUES ('e41c4030cc1bad2efe6b7797d126b6e8', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 05:59:06');
INSERT INTO `t_vistor_log` VALUES ('e5c026904c39cc0c1040672776ea5926', '4', '191178nx7z2K', 'http://localhost:8080/a/191178nx7z2K', '0:0:0:0:0:0:0:1', '2019-11-16 06:00:06');
INSERT INTO `t_vistor_log` VALUES ('e72341efc79f6efe6de69bd2de296096', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 05:44:51');
INSERT INTO `t_vistor_log` VALUES ('edf4007b06022670429ca26bcf1d5d0f', null, null, 'http://localhost:8080/s/Uv9vwKdO/1', '0:0:0:0:0:0:0:1', '2019-11-16 06:53:47');
INSERT INTO `t_vistor_log` VALUES ('ee64f945f67b3d736139f1a8069ab381', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 05:55:26');
INSERT INTO `t_vistor_log` VALUES ('eee09739f4888010c3e5f478d6a4d81e', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 06:32:38');
INSERT INTO `t_vistor_log` VALUES ('f1d8ba0f29825d2f6d012060e75a2c54', '4', '1911x3mugPKI', 'http://localhost:8080/a/1911x3mugPKI', '0:0:0:0:0:0:0:1', '2019-11-16 06:54:21');
INSERT INTO `t_vistor_log` VALUES ('f2b3aea3b7b8db2c87e4f7b29c16c9e1', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-16 06:54:02');
INSERT INTO `t_vistor_log` VALUES ('f3ffc4179c57ee7b69ea8378b770debd', null, null, 'http://localhost:8080/c/o96Gl3x6/1', '0:0:0:0:0:0:0:1', '2019-11-14 12:35:57');
INSERT INTO `t_vistor_log` VALUES ('f5301539a887aa362f803f6c24dffec7', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-14 13:12:22');
INSERT INTO `t_vistor_log` VALUES ('f6b20370996c85bab4b1ebcf5d930b2d', '4', '191178nx7z2K', 'http://localhost:8080/a/191178nx7z2K', '0:0:0:0:0:0:0:1', '2019-11-14 13:14:22');
INSERT INTO `t_vistor_log` VALUES ('f6e686b98a83aabfd1f70ba0efe74a25', null, null, 'http://localhost:8080/index', '0:0:0:0:0:0:0:1', '2019-11-14 13:16:46');
INSERT INTO `t_vistor_log` VALUES ('f92b6e09abccec2563234bf2ca4d8163', '4', '191169XV1IGh', 'http://localhost:8080/a/191169XV1IGh', '0:0:0:0:0:0:0:1', '2019-11-14 13:17:12');

-- ----------------------------
-- Table structure for t_website
-- ----------------------------
DROP TABLE IF EXISTS `t_website`;
CREATE TABLE `t_website` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vistor_num` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_website
-- ----------------------------
