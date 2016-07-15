package com.des.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.des.entity.Comment;
import com.des.entity.Goods;
import com.des.entity.GoodsInfo;
import com.des.entity.User;
import com.des.service.CommentServiceImpl;
import com.des.service.GoodsInfoServiceImpl;
import com.des.service.UserServiceImpl;
import com.des.util.Util;

@Controller
public class GoodsInfoController {
	@Autowired
	private UserServiceImpl userService;
	@Autowired
	private User user;
	@Autowired
	private CommentServiceImpl CommentService;
	@Autowired
	private Goods goods;
	@Autowired
	private GoodsInfo goodsInfo;
	@Autowired
	private GoodsInfoServiceImpl goodsInfoService;
	
	
	
	//进入出售商品页面
	@RequestMapping(value="sell" , method = RequestMethod.GET)
	public String sellGoods(HttpSession session){
		if(null == session.getAttribute("usern")){
			return "redirect:/login";//重定向，但是我有两个方法接收login 一个get 一个 post 会调用哪个呢？会调用get
		}
		return "jsp/addGoodsInfo";
	}
	
	//添加商品
	@RequestMapping(value="addGoods",method=RequestMethod.POST)
	public String addGoods(GoodsInfo goodsInfo,HttpSession session,
			@RequestParam(value = "file", required = false) MultipartFile[] file
			 ,HttpServletRequest request) throws Exception{
		if(null == session.getAttribute("usern")){
			System.out.println("\n\nhere is the addGoods method\n\n");
			return "redirect:/login";//重定向，但是我有两个方法接收login 一个get 一个 post 会调用哪个呢？会调用get
		}
		StringBuilder photo = new StringBuilder();
		//添加图片
		//获取绝对路径，因为操作File需要绝对路径
		String fullPath = request.getSession().getServletContext().getRealPath("upload"); 
		//定义相对路径，因为通过Web访问需要相对路径，所以存入数据库的是相对路径。
		String relativePath;
		//System.out.println("this is the path:");
		//System.out.println(fullPath);
		String fileName = "";
		//System.out.println("图片个数：");
		//System.out.println(file.length);//打印图片个数
		if (file.length > 0) {
			for (int i = 0; i < file.length; i++) {
				//fileName = new Date().getTime() + ".jpg";
				fileName = new Date().getTime() + file[i].getOriginalFilename();  
				//获得相对路径
				relativePath = request.getContextPath()+"/upload/"+fileName;
				File targetFile = new File(fullPath, fileName);
				//System.out.println(file[i].getSize()); //查看图片大小
				if (file[i].getSize() != 0) {// 当图片不为空是，存储图片
					try {
						file[i].transferTo(targetFile);
						//System.out.println(fullPath);//打印路径
						photo.append(relativePath+";");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		//添加图片
		goodsInfo.setPhoto(photo.toString());
		goodsInfo.setPublishTime(Util.getFormatDate());
		goodsInfo.setNewComment(Util.getFormatDateAll());
		goodsInfo.setReadTimes(0);
		goodsInfo.setUser(userService.getUserByName(session.getAttribute("usern").toString()));
		goodsInfoService.addGoodsInfo(goodsInfo);
		return "redirect:/index";
	}
	//通过Ajax实现分类查询
	@RequestMapping(value="testAjax",method=RequestMethod.POST)
	//可以在DAOImpl方法中直接返回List<Goods>而不是List<GoodsInfo>
	public @ResponseBody List<Goods> testAjax(@RequestParam String types){
		List<Goods> list = new ArrayList<Goods>();
		if("all".equals(types)){
			list=goodsInfoService.getAllGoods();
		}else{
			list = goodsInfoService.getGoodsByType(types);
		}
		if(null != list && 0 != list.size()){
			String[] pho ;
			for(Goods g : list){
				pho = g.getPhoto().split(";");
				if(pho[0].length()<1){
					pho[0]="/DES/upload/default_swu.jpg";
				}
				g.setPhoto(pho[0]);
				if(g.getTitle().length()>7){//若标题过长，只显示前七个字
					g.setTitle(g.getTitle().substring(0, 7));
				}
			}
			return list;
		}
		return list;
	}
	//显示商品信息详情
	 @RequestMapping(value="detail/{id}",method=RequestMethod.GET)
	 public String detail(@PathVariable int id,Model model){
		 goodsInfo = goodsInfoService.getGoods(id);
		 if(goodsInfo==null){
			 return "jsp/error";
		 }
		 goodsInfo.setReadTimes(goodsInfo.getReadTimes()+1);//增加浏览次数
		 goodsInfoService.updateGoodsInfo(goodsInfo);//更新表
		 String[] photos = goodsInfo.getPhoto().split(";");//拆分存入数据库的路径，在jsp上显示图片

		 Comment[] comm = new Comment[goodsInfo.getComment().size()];
		 int i = 0;
		 for(Comment com : goodsInfo.getComment()){
			 comm[i] = com;
			 ++i;
		 }
		 Util.quickSort(comm);//调用快排，按评论时间排序
		 goodsInfo.setComment(Arrays.asList(comm));
		 model.addAttribute("goodsInfo",goodsInfo);//通过${goodsInfo.xxx}获取属性
		 model.addAttribute("photos", photos);
		 
		 return "jsp/goodsDetail";
	 }
	//查看我发布的商品
	 @RequestMapping(value="listMyGoods",method=RequestMethod.GET)
	public String listMyGoods(HttpSession session,Model model){
		if(null == session.getAttribute("usern")){
			//System.out.println("\n\nhere is the addGoods method\n\n");
			return "redirect:/login";//重定向，但是我有两个方法接收login 一个get 一个 post 会调用哪个呢？会调用get
		}
		User u = userService.getUser(Integer.parseInt(session.getAttribute("userid").toString()));
		if(u==null){
			return "jsp/error";
		}
		//List<GoodsInfo> list = goodsInfoService.getGoodsByUser(u);
		Collections.reverse(u.getGoodsInfo());
		model.addAttribute("user", u);
		return "jsp/listMyGoods";
	}
	//删除已发布商品
	/*
	 * 猜测：由于我不知道的级联的某些特性，one-to-many中的many放无法删除，可能是因为one方已经取出，并持有一个list
	 * 里面保存了many方的数据，在删除many方后，one方的list将删除的重新插回数据库，导致错误 ......re-saved...
	 * 现在已经不再报上述的异常了
	 * 还有就是，在删除one-to-many方的one方时，由于未知原因无法级联删除，而many方有one方的外键，只删除one方会导致
	 * 错误。所以有一下尝试。
	 * 所有尝试：
	 *     1.将one方的List设值为null，解除与多方的关联。(没用)//List设为new ArrayList()(没用)
	 *     2.将one方持有的many方的数据一条一条删除，然后再删除one方。(没用，因为无法删除many方的数据...为什么？)
	 * 结果：success
	 *     这个例子貌似有点特别。user作为最上层的表，持有goodsinfo的一个List，也持有comment的一个List
	 *     而我要删除的goodsinfo属于中间层，上有user下有comment。一开始我删除goodsinfo，然而报了...re-saved...
	 *     的错。因为user中持有goodsinfo的对象，无法删除。需要在user对象中将对应的goodsinfo移除(remove(gs))。
	 *     同时在user中移除相应的comment。而在尝试2中，我虽然移除了goodsinfo持有的comment，但comment还是不能被删除，
	 *     就是因为在user里面也有comment的List，同样会包...re-saved...错。
	 *     最后解决：取出user并取出goodsinfo的list，移除需要删除的goodsinfo，同时取出comment的list，移除与将要删除
	 *     的goodsinfo相同的comment，即可删除goodsinfo。
	 *     
	 *     假若user中没有comment的list那么，只要将相应的goodsinfo从user中的goodsinfo的list中移除即可删除。
	 *     而若goodsinfo是最上层，如user，那么可以直接删除。
	 *     
	 *     哔了狗。
	 *     
	 * 好吧，又出现了一个问题。上次删除的goodsinfo里面，所有的评论都是发布者评的，所以在删除user方的comment时只需要移除发布方的
	 * list里面相应的comment就可以了。
	 * 但是，当goodsinfo里有多个不同用户的评论时，按之前成功的方法删除时，还是会报错：...re-saved...。
	 * So, 这就需要遍历所有的用户，移除所有关于该goodsinfo的评论，然后再删除......为什么这么麻烦。
	 */
	@RequestMapping(value="deleteGood/{id}",method=RequestMethod.GET)
	public String deleteGood(@PathVariable int id,HttpSession session,HttpServletRequest request){
		if(null == session.getAttribute("usern")){
			return "redirect:/login";//重定向，但是我有两个方法接收login 一个get 一个 post 会调用哪个呢？会调用get
		}
		GoodsInfo gs = goodsInfoService.getGoods(id);
		String photos[] = gs.getPhoto().split(";");
		User user = userService.getUser(gs.getUser().getId());
		user.getGoodsInfo().remove(gs);
		for(Comment com : gs.getComment()){
			for(User u : userService.getUser()){
				u.getComment().remove(com);
			}
		}
		goodsInfoService.deleteGoodsInfo(gs);
		
		
		/*
		//删除成功 start 当所有的评论都是发布者所发时，该代码段也能成功删除goodsinfo
		//可以删除user ，那么，从上往下删除好了。
		//userService.deleteUser(userService.getUser(gs.getUser().getId()));
		User user = userService.getUser(gs.getUser().getId());
		user.getGoodsInfo().remove(gs);
		for(Comment com : gs.getComment()){
			user.getComment().remove(com);
		}
		goodsInfoService.deleteGoodsInfo(gs);
		//删除成功 end
		*/
		
		//删除图片
		String fullPath = request.getSession().getServletContext().getRealPath("upload");
		 System.out.println(fullPath);
		 String strArray[];
		 String photoName;
		 for(String s:photos){
			//拆分路径
			 strArray = s.split("/");
			//获得图片名称
			 photoName = strArray[strArray.length-1];
			 //连接成绝对路径并删除图片
			 new File(fullPath+"\\"+photoName).delete();
		 }
		 //删除图片
		return "redirect:/listMyGoods";
	}
	
	
	
	
	
	// 批量删除 GET 不用
	@RequestMapping(value = "batchDeleteMsg", method = RequestMethod.GET)
	public String batchDeleteMsg() {
		return "jsp/testBatchDelete";
	}
	// 批量删除 POST 不用
	@RequestMapping(value = "batchDeleteMsg", method = RequestMethod.POST)
	public String batchDeleteMsg(
			@RequestParam(value = "deleteIt", required = false) Integer[] deleteIt) {
		System.out.println("\n\n\nhere is the array of checkbox!");
		for (int i = 0; i < deleteIt.length; i++) {
			System.out.println(deleteIt[i]);
		}
		return "jsp/testDelete";
	}
	// 上传图片 不用
	// http://localhost:8080/DES/upload.html或http://localhost:8080/DES/upload.jsp
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String testUpload(
			@RequestParam(value = "file", required = false) MultipartFile[] file,
			GoodsInfo goodsInfo, HttpServletRequest request) throws Exception {
		String path = request.getSession().getServletContext()
				.getRealPath("upload");
		System.out.println("this is the path:");
		System.out.println(path);
		String fileName = "";
		System.out.println("图片个数：");
		System.out.println(file.length);
		if (file.length > 0) {
			for (int i = 0; i < file.length; i++) {
				fileName = new Date().getTime() + ".jpg";// 图片名称
				File targetFile = new File(path, fileName);
				System.out.println(file[i].getSize());
				if (file[i].getSize() != 0) {// 当图片不为空是，存储图片
					try {
						file[i].transferTo(targetFile);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		System.out.println(request.getContextPath() + "/upload/" + fileName);// 图片完整路径
		return "redirect:/index";
	}
	 //无用
	 @Deprecated
	 @RequestMapping(value="photo",method=RequestMethod.GET)
	 public String toPhoto(){
		 return "uploadPage";
	 }
}
