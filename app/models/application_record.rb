require 'lz_utils'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end

  def formatted_updated_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end

  class << self
    # 定义多语言字段
    def has_one_localize(name)
      generated_association_methods.class_eval <<-CODE, __FILE__, __LINE__ + 1
        def #{name}!(locale = I18n.locale)
          locale = locale.to_sym
          @localized_#{name.to_s.pluralize} = {}
          I18n.available_locales.each do |l|
            @localized_#{name.to_s.pluralize}[l] = LocalizeRec.find_by(
                record_type: self.class.to_s,
                record_id: self.id,
                locale: l,
                name: '#{name}'
            )
          end
          @localized_#{name.to_s.pluralize}[locale]&.content
        end
      
        def #{name}(locale = I18n.locale)
          locale = locale.to_sym
          if @localized_#{name.to_s.pluralize}
            @localized_#{name.to_s.pluralize}[locale]&.content
          else
            #{name}!(locale)
          end
        end
      
        def set_#{name}(value, locale = I18n.locale)
          locale = locale.to_sym
          #{name}! if @localized_#{name.to_s.pluralize}.nil?
          @localized_#{name.to_s.pluralize}[locale] = LocalizeRec.create(
              record_type: self.class.to_s,
              record_id: self.id,
              locale: locale,
              name: '#{name}',
              content: value
          ) if @localized_#{name.to_s.pluralize}[locale].nil?
          @localized_#{name.to_s.pluralize}[locale].update(content: value)
        end
      
        def #{name}?(locale = I18n.locale)
          locale = locale.to_sym
          LocalizeRec.exists?(
              record_type: self.class.to_s,
              record_id: self.id,
              locale: locale,
              name: '#{name}'
          )
        end
      CODE

      has_many :"localized_#{name.to_s.pluralize}", -> { where(name: name) }, class_name: "LocalizeRec", as: :record, inverse_of: :record, dependent: :destroy do
        def purge
          each(&:purge)
          reset
        end

        def purge_later
          each(&:purge_later)
          reset
        end
      end
      scope :"with_localized_#{name.to_s.pluralize}", -> (locale = nil) {
        rs = includes("localized_#{name.to_s.pluralize}")
        rs = rs.where(localize_recs: {locale: locale}) if locale
        rs
      }
    end

    # 定义HTML字段
    def has_one_html(name)
      generated_association_methods.class_eval <<-CODE, __FILE__, __LINE__ + 1
        def #{name}(locale = nil)
          localized_html_#{name}(#{name}_obj, locale)
        end
  
        def #{name}!(locale = nil)
          localized_html_#{name}(#{name}_obj!, locale)
        end

        def set_#{name}(value, locale = nil)
          obj = #{name}_obj || Html.create(record_type: self.class.name, record_id: self.id, name: '#{name}')
          if locale
            h = obj.html_translations
            h[locale.to_s] = value
            obj.update(html_translations: h)
          else
            obj.update(html: value)
          end
        end
  
        def #{name}_obj
          @attached_html_#{name} || #{name}_obj!
        end
  
        def #{name}_obj!
          begin
            @attached_html_#{name} = Html.find_by(record_type: self.class.name, record_id: self.id, name: '#{name}')
          rescue Mongoid::Errors::DocumentNotFound
          end
        end
  
        def destroy_html_#{name}_obj
          Html.destroy_all(record_type: self.class.name, record_id: self.id, name: '#{name}')
        end

        def localized_html_#{name}(obj, locale = nil)
          if locale
            translations = obj&.html_translations
            translations[locale.to_s] if translations
          else
            obj&.html
          end
        end
  
        private :localized_html_#{name}
      CODE

      after_destroy :"destroy_html_#{name}_obj"
    end

    # 定义包含长文本字段
    def has_one_text(name)
      generated_association_methods.class_eval <<-CODE, __FILE__, __LINE__ + 1
        def #{name}(locale = nil)
          localized_text_#{name}(#{name}_obj, locale)
        end
  
        def #{name}!(locale = nil)
          localized_text_#{name}(#{name}_obj!, locale)
        end

        def set_#{name}(value, locale = nil)
          obj = #{name}_obj || Text.create(record_type: self.class.name, record_id: self.id, name: '#{name}')
          if locale
            h = obj.text_translations
            h[locale.to_s] = value
            obj.update(text_translations: h)
          else
            obj.update(text: value)
          end
        end
  
        def #{name}_obj
          @attached_text_#{name} || #{name}_obj!
        end
  
        def #{name}_obj!
          begin
            @attached_text_#{name} = Text.find_by(record_type: self.class.name, record_id: self.id, name: '#{name}')
          rescue Mongoid::Errors::DocumentNotFound
          end
        end
  
        def destroy_text_#{name}_obj
          Text.destroy_all(record_type: self.class.name, record_id: self.id, name: '#{name}')
        end

        def localized_text_#{name}(obj, locale = nil)
          if locale
            translations = obj&.text_translations
            translations[locale.to_s] if translations
          else
            obj&.text
          end
        end
  
        private :localized_text_#{name}
      CODE

      after_destroy :"destroy_text_#{name}_obj"
    end
  end
end
