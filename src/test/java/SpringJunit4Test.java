import com.web.bean.pojo.OrderItem;
import com.web.bean.pojo.ProductReview;
import com.web.service.OrderItemService;
import java.util.Date;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2019/7/23 13:19
 * @description:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext.xml","classpath:spring/dispatcher-servlet.xml"})
public class SpringJunit4Test {

    @Autowired
    private OrderItemService orderItemService;


    @Test
    public void testReview() {
        String id = "1da8a9a899284f8793ccade16326ddf9";
        Long userid = 5L;
        OrderItem orderItem = orderItemService.findByOiidAndUid(id, userid);
        //0不可评论 1可评论 2已评论 3审核中
        ProductReview review = new ProductReview();
//            review.setImages();
        review.setContent("评论内容");
        review.setRating(1.5);
        review.setUid(userid);
        review.setPid(orderItem.getPid());
        review.setTime(new Date());
        boolean mark = orderItemService.insertProductReview(review);
    }
}
