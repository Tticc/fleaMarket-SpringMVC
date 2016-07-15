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
	
	
	
	//���������Ʒҳ��
	@RequestMapping(value="sell" , method = RequestMethod.GET)
	public String sellGoods(HttpSession session){
		if(null == session.getAttribute("usern")){
			return "redirect:/login";//�ض��򣬵�������������������login һ��get һ�� post ������ĸ��أ������get
		}
		return "jsp/addGoodsInfo";
	}
	
	//�����Ʒ
	@RequestMapping(value="addGoods",method=RequestMethod.POST)
	public String addGoods(GoodsInfo goodsInfo,HttpSession session,
			@RequestParam(value = "file", required = false) MultipartFile[] file
			 ,HttpServletRequest request) throws Exception{
		if(null == session.getAttribute("usern")){
			System.out.println("\n\nhere is the addGoods method\n\n");
			return "redirect:/login";//�ض��򣬵�������������������login һ��get һ�� post ������ĸ��أ������get
		}
		StringBuilder photo = new StringBuilder();
		//���ͼƬ
		//��ȡ����·������Ϊ����File��Ҫ����·��
		String fullPath = request.getSession().getServletContext().getRealPath("upload"); 
		//�������·������Ϊͨ��Web������Ҫ���·�������Դ������ݿ�������·����
		String relativePath;
		//System.out.println("this is the path:");
		//System.out.println(fullPath);
		String fileName = "";
		//System.out.println("ͼƬ������");
		//System.out.println(file.length);//��ӡͼƬ����
		if (file.length > 0) {
			for (int i = 0; i < file.length; i++) {
				//fileName = new Date().getTime() + ".jpg";
				fileName = new Date().getTime() + file[i].getOriginalFilename();  
				//������·��
				relativePath = request.getContextPath()+"/upload/"+fileName;
				File targetFile = new File(fullPath, fileName);
				//System.out.println(file[i].getSize()); //�鿴ͼƬ��С
				if (file[i].getSize() != 0) {// ��ͼƬ��Ϊ���ǣ��洢ͼƬ
					try {
						file[i].transferTo(targetFile);
						//System.out.println(fullPath);//��ӡ·��
						photo.append(relativePath+";");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		//���ͼƬ
		goodsInfo.setPhoto(photo.toString());
		goodsInfo.setPublishTime(Util.getFormatDate());
		goodsInfo.setNewComment(Util.getFormatDateAll());
		goodsInfo.setReadTimes(0);
		goodsInfo.setUser(userService.getUserByName(session.getAttribute("usern").toString()));
		goodsInfoService.addGoodsInfo(goodsInfo);
		return "redirect:/index";
	}
	//ͨ��Ajaxʵ�ַ����ѯ
	@RequestMapping(value="testAjax",method=RequestMethod.POST)
	//������DAOImpl������ֱ�ӷ���List<Goods>������List<GoodsInfo>
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
				if(g.getTitle().length()>7){//�����������ֻ��ʾǰ�߸���
					g.setTitle(g.getTitle().substring(0, 7));
				}
			}
			return list;
		}
		return list;
	}
	//��ʾ��Ʒ��Ϣ����
	 @RequestMapping(value="detail/{id}",method=RequestMethod.GET)
	 public String detail(@PathVariable int id,Model model){
		 goodsInfo = goodsInfoService.getGoods(id);
		 if(goodsInfo==null){
			 return "jsp/error";
		 }
		 goodsInfo.setReadTimes(goodsInfo.getReadTimes()+1);//�����������
		 goodsInfoService.updateGoodsInfo(goodsInfo);//���±�
		 String[] photos = goodsInfo.getPhoto().split(";");//��ִ������ݿ��·������jsp����ʾͼƬ

		 Comment[] comm = new Comment[goodsInfo.getComment().size()];
		 int i = 0;
		 for(Comment com : goodsInfo.getComment()){
			 comm[i] = com;
			 ++i;
		 }
		 Util.quickSort(comm);//���ÿ��ţ�������ʱ������
		 goodsInfo.setComment(Arrays.asList(comm));
		 model.addAttribute("goodsInfo",goodsInfo);//ͨ��${goodsInfo.xxx}��ȡ����
		 model.addAttribute("photos", photos);
		 
		 return "jsp/goodsDetail";
	 }
	//�鿴�ҷ�������Ʒ
	 @RequestMapping(value="listMyGoods",method=RequestMethod.GET)
	public String listMyGoods(HttpSession session,Model model){
		if(null == session.getAttribute("usern")){
			//System.out.println("\n\nhere is the addGoods method\n\n");
			return "redirect:/login";//�ض��򣬵�������������������login һ��get һ�� post ������ĸ��أ������get
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
	//ɾ���ѷ�����Ʒ
	/*
	 * �²⣺�����Ҳ�֪���ļ�����ĳЩ���ԣ�one-to-many�е�many���޷�ɾ������������Ϊone���Ѿ�ȡ����������һ��list
	 * ���汣����many�������ݣ���ɾ��many����one����list��ɾ�������²�����ݿ⣬���´��� ......re-saved...
	 * �����Ѿ����ٱ��������쳣��
	 * ���о��ǣ���ɾ��one-to-many����one��ʱ������δ֪ԭ���޷�����ɾ������many����one���������ֻɾ��one���ᵼ��
	 * ����������һ�³��ԡ�
	 * ���г��ԣ�
	 *     1.��one����List��ֵΪnull�������෽�Ĺ�����(û��)//List��Ϊnew ArrayList()(û��)
	 *     2.��one�����е�many��������һ��һ��ɾ����Ȼ����ɾ��one����(û�ã���Ϊ�޷�ɾ��many��������...Ϊʲô��)
	 * �����success
	 *     �������ò���е��ر�user��Ϊ���ϲ�ı�����goodsinfo��һ��List��Ҳ����comment��һ��List
	 *     ����Ҫɾ����goodsinfo�����м�㣬����user����comment��һ��ʼ��ɾ��goodsinfo��Ȼ������...re-saved...
	 *     �Ĵ���Ϊuser�г���goodsinfo�Ķ����޷�ɾ������Ҫ��user�����н���Ӧ��goodsinfo�Ƴ�(remove(gs))��
	 *     ͬʱ��user���Ƴ���Ӧ��comment�����ڳ���2�У�����Ȼ�Ƴ���goodsinfo���е�comment����comment���ǲ��ܱ�ɾ����
	 *     ������Ϊ��user����Ҳ��comment��List��ͬ�����...re-saved...��
	 *     �������ȡ��user��ȡ��goodsinfo��list���Ƴ���Ҫɾ����goodsinfo��ͬʱȡ��comment��list���Ƴ��뽫Ҫɾ��
	 *     ��goodsinfo��ͬ��comment������ɾ��goodsinfo��
	 *     
	 *     ����user��û��comment��list��ô��ֻҪ����Ӧ��goodsinfo��user�е�goodsinfo��list���Ƴ�����ɾ����
	 *     ����goodsinfo�����ϲ㣬��user����ô����ֱ��ɾ����
	 *     
	 *     ���˹���
	 *     
	 * �ðɣ��ֳ�����һ�����⡣�ϴ�ɾ����goodsinfo���棬���е����۶��Ƿ��������ģ�������ɾ��user����commentʱֻ��Ҫ�Ƴ���������
	 * list������Ӧ��comment�Ϳ����ˡ�
	 * ���ǣ���goodsinfo���ж����ͬ�û�������ʱ����֮ǰ�ɹ��ķ���ɾ��ʱ�����ǻᱨ��...re-saved...��
	 * So, �����Ҫ�������е��û����Ƴ����й��ڸ�goodsinfo�����ۣ�Ȼ����ɾ��......Ϊʲô��ô�鷳��
	 */
	@RequestMapping(value="deleteGood/{id}",method=RequestMethod.GET)
	public String deleteGood(@PathVariable int id,HttpSession session,HttpServletRequest request){
		if(null == session.getAttribute("usern")){
			return "redirect:/login";//�ض��򣬵�������������������login һ��get һ�� post ������ĸ��أ������get
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
		//ɾ���ɹ� start �����е����۶��Ƿ���������ʱ���ô����Ҳ�ܳɹ�ɾ��goodsinfo
		//����ɾ��user ����ô����������ɾ�����ˡ�
		//userService.deleteUser(userService.getUser(gs.getUser().getId()));
		User user = userService.getUser(gs.getUser().getId());
		user.getGoodsInfo().remove(gs);
		for(Comment com : gs.getComment()){
			user.getComment().remove(com);
		}
		goodsInfoService.deleteGoodsInfo(gs);
		//ɾ���ɹ� end
		*/
		
		//ɾ��ͼƬ
		String fullPath = request.getSession().getServletContext().getRealPath("upload");
		 System.out.println(fullPath);
		 String strArray[];
		 String photoName;
		 for(String s:photos){
			//���·��
			 strArray = s.split("/");
			//���ͼƬ����
			 photoName = strArray[strArray.length-1];
			 //���ӳɾ���·����ɾ��ͼƬ
			 new File(fullPath+"\\"+photoName).delete();
		 }
		 //ɾ��ͼƬ
		return "redirect:/listMyGoods";
	}
	
	
	
	
	
	// ����ɾ�� GET ����
	@RequestMapping(value = "batchDeleteMsg", method = RequestMethod.GET)
	public String batchDeleteMsg() {
		return "jsp/testBatchDelete";
	}
	// ����ɾ�� POST ����
	@RequestMapping(value = "batchDeleteMsg", method = RequestMethod.POST)
	public String batchDeleteMsg(
			@RequestParam(value = "deleteIt", required = false) Integer[] deleteIt) {
		System.out.println("\n\n\nhere is the array of checkbox!");
		for (int i = 0; i < deleteIt.length; i++) {
			System.out.println(deleteIt[i]);
		}
		return "jsp/testDelete";
	}
	// �ϴ�ͼƬ ����
	// http://localhost:8080/DES/upload.html��http://localhost:8080/DES/upload.jsp
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String testUpload(
			@RequestParam(value = "file", required = false) MultipartFile[] file,
			GoodsInfo goodsInfo, HttpServletRequest request) throws Exception {
		String path = request.getSession().getServletContext()
				.getRealPath("upload");
		System.out.println("this is the path:");
		System.out.println(path);
		String fileName = "";
		System.out.println("ͼƬ������");
		System.out.println(file.length);
		if (file.length > 0) {
			for (int i = 0; i < file.length; i++) {
				fileName = new Date().getTime() + ".jpg";// ͼƬ����
				File targetFile = new File(path, fileName);
				System.out.println(file[i].getSize());
				if (file[i].getSize() != 0) {// ��ͼƬ��Ϊ���ǣ��洢ͼƬ
					try {
						file[i].transferTo(targetFile);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		System.out.println(request.getContextPath() + "/upload/" + fileName);// ͼƬ����·��
		return "redirect:/index";
	}
	 //����
	 @Deprecated
	 @RequestMapping(value="photo",method=RequestMethod.GET)
	 public String toPhoto(){
		 return "uploadPage";
	 }
}
